import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/student_checkin_controller.dart.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanStudentQrCode extends StatefulWidget {
  const ScanStudentQrCode({Key? key, required this.isCheckIn}) : super(key: key);
 final bool isCheckIn;
  @override
  State<ScanStudentQrCode> createState() => _ScanStudentQrCodeState();
}

class _ScanStudentQrCodeState extends State<ScanStudentQrCode> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Student Code"),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.grey,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        allowDuplicates: true,
        controller: cameraController,
        onDetect: _foundBarcode,
      ),
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    /// open screen
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? "---";
      debugPrint('Barcode found! $code');
      _screenOpened = true;
       if(widget.isCheckIn){
         Get.to(CheckIn(value: code, screenClosed: _screenWasClosed));
       }else{
         Get.to(CheckOut(value: code, screenClosed: _screenWasClosed));
       }
      
      
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

class CheckIn extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const CheckIn({
    Key? key,
    required this.value,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final checkInStudentController = Get.put(CheckInStudentController());
  @override
  initState() {
    checkInStudentController.studentCheckIn(studentCode: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check In"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            widget.screenClosed();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/loading.svg'),
                Container(
                  color: Colors.white,
                  child: checkInStudentController.isCheckInStudent.isFalse
                      ? const LinearProgressIndicator(
                          color: Colors.red,
                        )
                      : const SizedBox(
                          height: 20,
                        ),
                ),
               const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('Checking student in'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckOut extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const CheckOut({
    Key? key,
    required this.value,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final checkInStudentController = Get.put(CheckInStudentController());
  @override
  initState() {
    checkInStudentController.studentCheckOut(studentCode: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            widget.screenClosed();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
              SvgPicture.asset('assets/svgs/loading.svg'),
                Container(
                  color: Colors.white,
                  child: checkInStudentController.isCheckInStudent.isFalse
                      ? const LinearProgressIndicator(
                          color: Colors.red,
                        )
                      : const SizedBox(
                          height: 20,
                        ),
                ),
               const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('Checking student out'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
