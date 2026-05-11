'use static'

import {
  $r,
  Entry,
  ForEach,
  Text,
  Row,
  Column,
  Stack,
  List,
  ListItem,
  Radio,
  Axis,
  Divider,
  Component,
  Button,
  Image,
  Color,
  ClickEvent,
  Alignment,
  DialogAlignment,
  HorizontalAlign,
  CustomDialog,
  CustomDialogController,
  XComponentController,
  XComponent,
  XComponentOptions,
  XComponentType
} from '@ohos.arkui.component'
import { State, Link } from '@ohos.arkui.stateManagement'
import media from '@ohos.multimedia.media';
import { dateTime } from '../utils/DateTimeUtil';
import Logger from '../utils/Logger';
import RecorderFileUtil from '../utils/RecorderFileUtil';
import display from '@ohos.display';
import AVRecorderService from '../services/AVRecorderService';
import { Resolution } from '../services/CommonTypes';
import CameraService from '../services/CameraService';

const TAG: string = 'Sample_VideoRecorder';

@Entry
@Component
struct VideoRecorder {
  private recorderService: AVRecorderService = new AVRecorderService();
  private cameraService: CameraService = new CameraService();
  private surfaceId: string = '';
  xComponentController: XComponentController = new XComponentController();
  @State videoRecorderTimeText: string = '00:00';
  private seconds: int = 0;
  private timer: int = 0;
  @State videoResolution: Resolution = { frameWidth: 1920, frameHeight: 1080} as Resolution;
  @State isStartRecording: boolean = false;
  @State isPauseRecording: boolean = false;

  aboutToAppear(): void {
    Logger.info(TAG, 'aboutToAppear');
  }

  aboutToDisappear(): void {
    Logger.info(TAG, 'aboutToDisappear called');
    this.releaseCamera();
  }

  onPageShow(): void {
    Logger.info(TAG, 'onPageShow called');
    this.enterInit();
  }

  onPageHide(): void {
    Logger.info(TAG, 'onPageHide called');
    this.stopRecordingProcess();
  }

  // show recording time
  getRecordTime(): void {
    this.timer = setInterval(() => {
      this.seconds += 1;
      this.videoRecorderTimeText = dateTime(this.seconds);
    }, 1000);
  }

  // clear camera environment
  async releaseCamera(): Promise<void> {
    Logger.info(TAG, 'releaseCamera begin');
    await this.cameraService.release();
    Logger.info(TAG, 'releaseCamera end');
  }

  // init camera
  async enterInit(): Promise<void> {
    Logger.info(TAG, 'enterInit begin');
    this.cameraService.init(this.getUIContext().getHostContext()!); // 获取设备相机信息
    await this.cameraService.createInput(); // 打开相机
    this.cameraService.createPreviewOutput(this.recorderService, this.surfaceId); // 创建预览流
    await this.cameraService.createCaptureSession(); // 创建会话，保存一次相机运行需要的所有资源，并向相机设备申请完成相机功能
    await this.cameraService.startCaptureSession(); // 开启会话
    Logger.info(TAG, 'enterInit end');
  }

  // start button process
  async startRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'startRecordingProcess begin');
    await this.recorderService.createRecorder();
    this.recorderService.setCallback((state, reason) => {
      switch (state) {
        case 'started':
          this.getRecordTime();
          this.isStartRecording = true;
          this.isPauseRecording = false;
          break;
        case 'paused':
          clearInterval(this.timer);
          this.isPauseRecording = true;
          break;
        case 'stopped':
          this.isStartRecording = false;
          break;
        default:
          break;
      }
    });
    this.recorderService.configAudioDefault();
    this.recorderService.configVideoDefault();
    let fd: int = await RecorderFileUtil.createVideoFile(this.getUIContext().getHostContext()!);
    this.recorderService.configOutputFile(fd, media.ContainerFormatType.CFT_MPEG_4);
    this.recorderService.configVideoResolution(this.videoResolution!);
    await this.recorderService.prepareRecorder();
    let surfaceId: string | undefined = await this.recorderService.getInputSurface();
    if (surfaceId) {
      await this.cameraService.restartVideoOutput(surfaceId!);
    }
    await this.recorderService.startRecorder();
    Logger.info(TAG, 'startRecordingProcess end');
  }

  // pause button process
  async pauseRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'pauseRecordingProcess begin');
    await this.recorderService.pauseRecorder();
    await this.cameraService.stopVideoOutput();
    Logger.info(TAG, 'pauseRecordingProcess end');
  }

  // resume button process
  async resumeRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'resumeRecordingProcess begin');
    await this.cameraService.startVideoOutput();
    await this.recorderService.resumeRecorder();
    Logger.info(TAG, 'resumeRecordingProcess end');
  }

  // stop button process
  async stopRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'stopRecordingProcess begin');
    await this.recorderService.stopRecorder();
    await this.recorderService.releaseRecorder();
    await this.cameraService.stopVideoOutput();
    await this.recorderService.closeFd();
    clearInterval(this.timer);
    this.isStartRecording = false;
    this.isPauseRecording = false;
    this.seconds = 0;
    this.videoRecorderTimeText = '00:00';
    Logger.info(TAG, 'stopRecordingProcess end');
  }


  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Center }) {
          XComponent({
            type: XComponentType.SURFACE,
            controller: this.xComponentController
          })
          .onLoad(() => {
            let displayObj: display.Display = display.getDefaultDisplaySync();
            this.xComponentController.setXComponentSurfaceRect({
              surfaceWidth: displayObj.width,
              surfaceHeight: displayObj.height
            });
            Logger.info(TAG, '[VideoRecorder] surface size: ' + displayObj.height + 'x' + displayObj.width);
            this.surfaceId = this.xComponentController.getXComponentSurfaceId();
            Logger.info(TAG, '[VideoRecorder] surfaceId: ' + this.surfaceId);
            Logger.info(TAG, 'XComponent1 loaded');
          })
            .width('100%').height('100%')
            .backgroundColor(Color.Black)
          Text(this.videoRecorderTimeText)
            .fontFamily('HarmonyHeiTi-Light')
            .width(70)
            .height(40)
            .fontSize(27)
            .fontColor('white')
            .margin({ left: 155, top: 18, right: 135, bottom: 707})
          if (!this.isStartRecording) {
            Image($r('app.media.ic_setting'))
              .width(40)
              .height(40)
              .margin({ left: 12, top: 12, right: 308, bottom: 704})
              .onClick(() => {
                if (this.settingDialog !== undefined) {
                  Logger.info(TAG, 'to open setting dialog');
                  this.settingDialog.open();
                }
              })
              .id('videoSetting')
            Image($r('app.media.ic_red_circle'))
              .width(12)
              .height(12)
              .margin({ left: 136, top: 25, right: 212, bottom: 715})
            Image($r('app.media.take_video_normal'))
              .width(86)
              .height(86)
              .margin({ left: 132, top: 612, right: 132, bottom: 72})
              .onClick(() => { this.startRecordingProcess(); })
              .id('videoStart')
          }
          else {
            Image($r('app.media.ic_circle_open'))
              .width(120)
              .height(56)
              .margin({ left: 120, top: 632, right: 120, bottom: 92})
            Image($r('app.media.ic_stop'))
              .width(16)
              .height(16)
              .margin({ left: 146, top: 652, right: 198, bottom: 112})
              .onClick(() => { this.stopRecordingProcess(); })
              .id('videoStop')
            if (!this.isPauseRecording) {
              Image($r('app.media.ic_red_circle'))
                .width(12)
                .height(12)
                .margin({ left: 136, top: 25, right: 212, bottom: 715})
              Image($r('app.media.ic_pause'))
                .width(14)
                .height(15)
                .margin({ left: 200, top: 652, right: 146, bottom: 113})
                .onClick(() => { this.pauseRecordingProcess(); })
                .id('videoPause')
            } else {
              Image($r('app.media.ic_small_pause'))
                .width(14)
                .height(14)
                .margin({ left: 136, top: 25, right: 212, bottom: 715})
              Image($r('app.media.ic_continue'))
                .width(16)
                .height(16)
                .margin({ left: 198, top: 651, right: 144, bottom: 111})
                .onClick(() => { this.resumeRecordingProcess(); })
                .id('videoResume')
            }
          }
        }.width('100%').height('100%')
      }
    }
  }

  onCancel() {
    Logger.info(TAG, 'Callback when the cancel button is clicked')
  }

  onConfirm(videoResolution: Resolution) {
    Logger.info(TAG, 'Callback when the confirm button is clicked')
    this.recorderService.configVideoResolution(videoResolution);
  }

  existApp() {
    Logger.info(TAG, 'Click the callback in the blank area')
  }

  settingDialog: CustomDialogController = new CustomDialogController({
    builder: CustomDialogSetting({
      cancel: this.onCancel,
      confirm: this.onConfirm,
      videoResolution: this.videoResolution,
    }),
    cancel: this.existApp,
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })
}

class VideoResolution {
  public desc: string = ''
  public value: Resolution = { frameWidth: 0, frameHeight: 0 }
}

@CustomDialog
struct CustomDialogSetting {
  @Link videoResolution: Resolution;
  controller?: CustomDialogController;
  cancel?: () => void;
  confirm?: (videoResolution: Resolution) => void;
  @State currentVideoResolution: Resolution = { frameWidth: 1920, frameHeight: 1080 } as Resolution;
  private selectedVideoResolution: Resolution = this.currentVideoResolution;
  @State videoResolutionList: Array<VideoResolution> = [
    { desc: '16:9 (720p)', value: { frameWidth: 1280, frameHeight: 720 } } as VideoResolution,
    { desc: '16:9 (1080p)', value: { frameWidth: 1920, frameHeight: 1080 } } as VideoResolution,
  ];

  build() {
    Column() {
      Column() {
        Text($r('app.string.video_parameter'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(20)
          .width(288)
          .height(26)
          .margin({ left: 24, top: 16, right: 24 })
        Column() {
          List({ space: 10 }) {
            ForEach(this.videoResolutionList, (item: VideoResolution, index) => {
              ListItem() {
                Row() {
                  Text($r('app.string.video_resolution'))
                    .fontSize(16)
                  Text(item.desc)
                    .fontSize(16)
                    .width(160)
                    .fontFamily('HarmonyHeiTi-Medium')
                  Radio({ value: item.value.toString(), group: 'videoResolutionRadioGroup' })
                    .checked(item.value.frameWidth == this.currentVideoResolution.frameWidth &&
                      item.value.frameHeight == this.currentVideoResolution.frameHeight)
                    .height(24)
                    .onChange((isChecked: boolean) => {
                      if (isChecked) {
                        Logger.info(TAG, item.desc + ' resolution is clicked')
                        this.selectedVideoResolution = item.value;
                      }
                    })
                }.margin({ left: 0, right: 39 })
              }
            })
          }.listDirection(Axis.Vertical)
          .divider({ strokeWidth: 0.5, color: '#EEEEEE', startMargin: 0, endMargin: 0 })
        }.margin({ left: 24, right: 24, top: 16 })
      }.alignItems(HorizontalAlign.Start)
      Row() {
        Button($r('app.string.button_cancel'))
          .onClick(() => {
            this.selectedVideoResolution = this.currentVideoResolution;
            this.controller?.close();
            if (this.cancel) {
              this.cancel!();
            }
          })
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('app.color.button_color'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .id('videoCancel')
          .layoutWeight(1)
        Divider()
          .vertical(true)
          .height(24)
          .color($r('app.color.divider_color'))
          .opacity(0.6)
          .margin({ left: 8, right: 8 })
        Button($r('app.string.button_confirm'))
          .onClick(() => {
            this.currentVideoResolution = this.selectedVideoResolution;
            this.controller?.close();
            if (this.confirm) {
              this.confirm!(this.currentVideoResolution);
            }
          })
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('app.color.button_color'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .id('videoConfirm')
          .layoutWeight(1)
      }
      .width(300)
      .height(40)
      .margin({left: 24, right: 24, top: 12, bottom: 16})
    }
    .margin({left: 12, right: 12, bottom: 12})
    .backgroundColor($r('app.color.button_background'))
    .borderRadius(32)
    .alignItems(HorizontalAlign.Center)
  }
}