import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

// Define the ControlState class
// Update ControlState to include temperature-related properties
class ControlState extends Equatable {
  final bool isAutomaticMode;
  final bool isTiltMode;
  final bool isVacuumMode;
  final bool isSweepMode;
  final String tiltDirection;
  final bool isMovementInProgress;
  final StreamSubscription<AccelerometerEvent>? accelerometerSubscription;
  final bool isRobotOn;

  const ControlState({
    this.isAutomaticMode = false,
    this.isTiltMode = false,
    this.isVacuumMode = false,
    this.isSweepMode = false,
    this.tiltDirection = 'stop',
    this.isMovementInProgress = false,
    this.accelerometerSubscription,
    this.isRobotOn = false,
  });

  ControlState copyWith({
    bool? isAutomaticMode,
    bool? isTiltMode,
    bool? isVacuumMode,
    bool? isSweepMode,
    String? temperature,
    bool? isTemperatureFetched, // Add this to copyWith
    String? tiltDirection,
    bool? isMovementInProgress,
    StreamSubscription<AccelerometerEvent>? accelerometerSubscription,
    bool? isRobotOn,
  }) {
    return ControlState(
      isAutomaticMode: isAutomaticMode ?? this.isAutomaticMode,
      isTiltMode: isTiltMode ?? this.isTiltMode,
      isVacuumMode: isVacuumMode ?? this.isVacuumMode,
      isSweepMode: isSweepMode ?? this.isSweepMode,
       tiltDirection: tiltDirection ?? this.tiltDirection,
      isMovementInProgress: isMovementInProgress ?? this.isMovementInProgress,
      accelerometerSubscription:
      accelerometerSubscription ?? this.accelerometerSubscription,
      isRobotOn: isRobotOn ?? this.isRobotOn,
    );
  }

  @override
  List<Object?> get props => [
    isAutomaticMode,
    isTiltMode,
    isVacuumMode,
    isSweepMode,
    tiltDirection,
    isMovementInProgress,
    isRobotOn,
  ];
}

// In the ControlCubit class, add temperature-related methods
class ControlCubit extends Cubit<ControlState> {
  ControlCubit() : super(ControlState());

  // Add a method to fetch temperature
  void toggleVacuumMode() {
    if (state.isSweepMode) {
      // Cannot enable vacuum if sweep mode is active
      return;
    }
    emit(state.copyWith(
      isVacuumMode: !state.isVacuumMode,
      isSweepMode: false,
    ));
    print(state.isVacuumMode ? "vacuum selected" : "vacuum not selected");
  }

  void toggleSweepMode() {
    if (state.isVacuumMode) {
      // Cannot enable sweep if vacuum mode is active
      return;
    }
    emit(state.copyWith(
      isSweepMode: !state.isSweepMode,
      isVacuumMode: false,
    ));
    print(state.isSweepMode ? "sweep selected" : "sweep not selected");
  }

  void toggleTiltMode() {
    if (state.isAutomaticMode) {
      // Cannot enable tilt mode if automatic mode is active
      return;
    }
    if (state.isTiltMode) {
      // Turn off tilt mode and stop listening to accelerometer
      state.accelerometerSubscription?.cancel();
      emit(state.copyWith(
        isTiltMode: false,
        tiltDirection: 'stop',
        isMovementInProgress: false,
        accelerometerSubscription: null,
      ));
    } else {
      // Turn on tilt mode and start listening to accelerometer
      final accelerometerSubscription = accelerometerEvents.listen((event) {
        _handleAccelerometerEvent(event);
      });
      emit(state.copyWith(
        isTiltMode: true,
        isAutomaticMode: false,
        accelerometerSubscription: accelerometerSubscription,
      ));
    }
  }

  void toggleAutomaticMode() {
    if (state.isTiltMode) {
      // Cannot enable automatic mode if tilt mode is active
      return;
    }
    emit(state.copyWith(
      isAutomaticMode: !state.isAutomaticMode,
    ));
  }


  void toggleRobotState() {
    // Toggle the robot's on/off state
    emit(state.copyWith(isRobotOn: !state.isRobotOn));
    print(state.isRobotOn ? "Robot is ON" : "Robot is OFF");
  }

  void _handleAccelerometerEvent(AccelerometerEvent event) {
    if (state.isMovementInProgress) {
      return; // Ignore sensor events if movement is in progress
    }

    double threshold = 5.0; // Adjust the threshold as needed

    String newDirection = 'stop';

    // Determine the tilt direction based on accelerometer readings
    if (event.x > threshold) {
      // Device tilted left
      newDirection = 'left';
    } else if (event.x < -threshold) {
      // Device tilted right
      newDirection = 'right';
    } else if (event.y > threshold) {
      // Device tilted backward
      newDirection = 'backward';
    } else if (event.y < -threshold) {
      // Device tilted forward
      newDirection = 'forward';
    } else {
      return; // No significant tilt detected
    }

    // Initiate movement
    emit(state.copyWith(
      tiltDirection: newDirection,
      isMovementInProgress: true,
    ));
    _sendMoveCommand(newDirection);

    // Start a timer for 1 second to hold the movement
    Timer(Duration(seconds: 1), () {
      // After 1 second, stop the movement
      _sendMoveCommand('stop');
      emit(state.copyWith(
        isMovementInProgress: false,
        tiltDirection: 'stop',
      ));
    });
  }

  void _sendMoveCommand(String direction) {
    // Implement the services to send movement commands to your robot
    print('Sending command: $direction');
    // For example, send the command via Bluetooth or HTTP
  }

  @override
  Future<void> close() {
    // Cancel the accelerometer subscription when the Cubit is closed
    state.accelerometerSubscription?.cancel();
    return super.close();
  }
}