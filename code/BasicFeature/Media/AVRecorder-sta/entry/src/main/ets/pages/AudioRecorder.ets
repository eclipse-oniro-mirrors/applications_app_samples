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
  CustomDialogController
} from '@ohos.arkui.component'
import { State, Link } from '@ohos.arkui.stateManagement'
import media from '@ohos.multimedia.media';
import Logger from '../utils/Logger';
import RecorderFileUtil from '../utils/RecorderFileUtil';
import { dateTime } from '../utils/DateTimeUtil';
import AVRecorderService from '../services/AVRecorderService';

const TAG: string = 'Sample_AudioRecorder';

@Entry
@Component
struct AudioRecorder {
  private recorderService: AVRecorderService = new AVRecorderService();
  @State audioRecorderTimeText: string = '00:00';
  private seconds: int = 0;
  private timer: int = 0;
  @State isStartRecording: boolean = false;
  @State isPauseRecording: boolean = false;
  @State audioChannels: int = 2; // set default audioChannels 2
  @State audioSampleRate: int = 48000; // set default audioSampleRate 48000

  aboutToAppear(): void {
    Logger.info(TAG, 'aboutToAppear');
  }

  aboutToDisappear(): void {
    Logger.info(TAG, 'aboutToDisappear');
  }

  // show recording time
  getRecordTime(): void {
    this.timer = setInterval(() => {
      this.seconds += 1;
      this.audioRecorderTimeText = dateTime(this.seconds);
    }, 1000)
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
    let fd: int = await RecorderFileUtil.createAudioFile(this.getUIContext().getHostContext()!);
    this.recorderService.configOutputFile(fd, media.ContainerFormatType.CFT_MPEG_4A);
    await this.recorderService.prepareRecorder();
    await this.recorderService.startRecorder();
    Logger.info(TAG, 'startRecordingProcess end');
  }

  // pause button process
  async pauseRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'pauseRecordingProcess begin');
    await this.recorderService.pauseRecorder();
    Logger.info(TAG, 'pauseRecordingProcess end');
  }

  // resume button process
  async resumeRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'pauseRecordingProcess begin');
    await this.recorderService.resumeRecorder();
    Logger.info(TAG, 'pauseRecordingProcess end');
  }

  // stop button process
  async stopRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'stopRecordingProcess begin');
    await this.recorderService.stopRecorder();
    await this.recorderService.releaseRecorder();
    await this.recorderService.closeFd();
    clearInterval(this.timer);
    this.isStartRecording = false;
    this.isPauseRecording = false;
    this.seconds = 0;
    this.audioRecorderTimeText = '00:00';
    Logger.info(TAG, 'stopRecordingProcess end');
  }

  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Center }) {
          Text(this.audioRecorderTimeText)
            .fontFamily('HarmonyHeiTi-Light')
            .width(70)
            .height(40)
            .fontSize(27)
            .fontColor('white')
            .margin({
              left: 99,
              top: 13,
              right: 79,
              bottom: 703
            })
          if (!this.isStartRecording) {
            Image($r('app.media.ic_setting'))
              .width(40)
              .height(40)
              .margin({
                left: 12,
                top: 12,
                right: 308,
                bottom: 704
              })
              .onClick(() => {
                if (this.settingDialog !== undefined) {
                  Logger.info(TAG, 'to open setting dialog');
                  this.settingDialog.open()
                }
              })
              .id('audioSetting')
            Image($r('app.media.ic_red_circle'))
              .width(12)
              .height(12)
              .margin({
                left: 136,
                top: 25,
                right: 212,
                bottom: 715
              })
            Image($r('app.media.take_video_normal'))
              .width(86)
              .height(86)
              .margin({
                left: 132,
                top: 612,
                right: 132,
                bottom: 72
              })
              .onClick(async () => {
                Logger.info(TAG, 'start button clicked');
                await this.startRecordingProcess();
              })
              .id('audioStart')
          } else {
            Image($r('app.media.ic_circle_open'))
              .width(120)
              .height(56)
              .margin({
                left: 120,
                top: 632,
                right: 120,
                bottom: 92
              })
            Image($r('app.media.ic_stop'))
              .width(16)
              .height(16)
              .margin({
                left: 146,
                top: 652,
                right: 198,
                bottom: 112
              })
              .onClick(() => {
                this.stopRecordingProcess();
              })
              .id('audioStop')
            if (!this.isPauseRecording) {
              Image($r('app.media.ic_red_circle'))
                .width(12)
                .height(12)
                .margin({
                  left: 136,
                  top: 25,
                  right: 212,
                  bottom: 715
                })
              Image($r('app.media.ic_pause'))
                .width(14)
                .height(15)
                .margin({
                  left: 200,
                  top: 652,
                  right: 146,
                  bottom: 113
                })
                .onClick(() => {
                  this.pauseRecordingProcess();
                })
                .id('audioPause')
            } else {
              Image($r('app.media.ic_small_pause'))
                .width(14)
                .height(14)
                .margin({
                  left: 136,
                  top: 25,
                  right: 212,
                  bottom: 715
                })
              Image($r('app.media.ic_continue'))
                .width(16)
                .height(16)
                .margin({
                  left: 198,
                  top: 651,
                  right: 144,
                  bottom: 111
                })
                .onClick(() => {
                  this.resumeRecordingProcess();
                })
                .id('audioResume')
            }
          }
        }.width('100%').height('100%')
      }.backgroundColor(Color.Black)
    }
  }

  onCancel() {
    Logger.info(TAG, 'Callback when the cancel button is clicked');
  }

  onConfirm(audioSampleRate: int) {
    Logger.info(TAG, 'Callback when the confirm button is clicked');
    this.recorderService.configAudioSampleRate(audioSampleRate);
  }

  existApp() {
    Logger.info(TAG, 'Click the callback in the blank area');
  }

  settingDialog: CustomDialogController = new CustomDialogController({
    builder: CustomDialogSetting({
      cancel: this.onCancel,
      confirm: this.onConfirm,
      currentAudioChannels: this.audioChannels,
      currentAudioSampleRate: this.audioSampleRate,
    }),
    cancel: this.existApp,
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    customStyle: true
  })
}


@CustomDialog
struct CustomDialogSetting {
  controller?: CustomDialogController
  cancel?: () => void
  confirm?: (audioSampleRate: int) => void
  @State currentAudioChannels: int = 2
  @State currentAudioSampleRate: int = 48000
  private selectedAudioChannels: int = this.currentAudioChannels
  private selectedAudioSampleRate: int = this.currentAudioSampleRate
  @State audioChannelsList: Array<int> = [1, 2]
  @State audioSampleRateList: Array<int> = [8000, 22050, 32000, 44100, 48000, 96000]

  build() {
    Column() {
      Column() {
        Text($r('app.string.audio_parameter'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(20)
          .width(288)
          .height(26)
          .margin({ left: 24, right: 24, top: 16 })
        Column() {
          List({ space: 10 }) {
            ForEach(this.audioSampleRateList, (item: int, index) => {
              ListItem() {
                Row() {
                  Text($r('app.string.audio_sample_rate'))
                    .fontSize(16)
                  Text(item.toString())
                    .fontSize(16)
                    .width(160)
                  Radio({ value: item.toString(), group: 'audioSampleRateRadioGroup' })
                    .checked(item == this.currentAudioSampleRate)
                    .height(20)
                    .onChange((isChecked: boolean) => {
                      if (isChecked) {
                        this.selectedAudioSampleRate = item;
                      }
                    })
                }.margin({ left: 0, right: 39 })
              }
            })
          }.listDirection(Axis.Vertical)
          .divider({
            strokeWidth: 0.5,
            color: '#EEEEEE',
            startMargin: 0,
            endMargin: 0
          })
        }.margin({ left: 24, right: 24, top: 16 })
      }.alignItems(HorizontalAlign.Start)

      Row() {
        Button($r('app.string.button_cancel'))
          .onClick(() => {
            this.selectedAudioSampleRate = this.currentAudioSampleRate;
            this.controller?.close();
            if (this.cancel) {
              this.cancel!();
            }
          })
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('app.color.button_color'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .id('audioCancel')
          .layoutWeight(1)
        Divider()
          .vertical(true)
          .height(24)
          .color($r('app.color.divider_color'))
          .opacity(0.6)
          .margin({ left: 8, right: 8 })
        Button($r('app.string.button_confirm'))
          .onClick(() => {
            this.currentAudioSampleRate = this.selectedAudioSampleRate;
            this.controller?.close();
            if (this.confirm) {
              this.confirm!(this.currentAudioSampleRate);
            }
          })
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('app.color.button_color'))
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize(16)
          .id('audioConfirm')
          .layoutWeight(1)
      }
      .width(300)
      .height(40)
      .margin({ top: 12, bottom: 16 })
    }
    .margin({ left: 12, right: 12, bottom: 12 })
    .backgroundColor($r('app.color.button_background'))
    .borderRadius(32)
    .alignItems(HorizontalAlign.Center)
  }
}