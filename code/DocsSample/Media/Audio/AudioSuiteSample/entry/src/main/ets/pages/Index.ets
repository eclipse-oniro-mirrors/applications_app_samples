/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import audioSuiteNapi from 'libentry.so';
import { common } from '@kit.AbilityKit'
import { fileIo as fs } from '@kit.CoreFileKit';
import { DirInitHelper } from '../utils/DirInit';

const EQ_PRESET_NAMES = ['自定义', '默认', '民谣', '中国风', '古典', '舞曲', '爵士', '流行', 'R&B', '摇滚'];
const EQ_PRESET_OPTIONS: SelectOption[] = [
  { value: '自定义' }, { value: '默认' }, { value: '民谣' }, { value: '中国风' },
  { value: '古典' }, { value: '舞曲' }, { value: '爵士' }, { value: '流行' },
  { value: 'R&B' }, { value: '摇滚' }
];
const EQ_PRESET_VALUES: number[][] = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [3, 5, 2, -4, 1, 2, -3, 1, 4, 5],
  [0, 0, 2, 0, 0, 4, 4, 2, 2, 5],
  [2, 3, 2, 1, 0, 0, -5, -5, -5, -6],
  [4, 3, 2, -3, 0, 0, 5, 4, 2, 0],
  [2, 0, 2, 3, 6, 5, -1, 3, 4, 4],
  [5, 2, 1, -1, -5, -5, -2, 1, 2, 4],
  [1, 4, 5, 3, -2, -2, 2, 3, 5, 5],
  [6, 4, 4, 2, 0, 1, 3, 3, 5, 4]
];
const EQ_BAND_LABELS = ['31Hz', '62Hz', '125Hz', '250Hz', '500Hz', '1kHz', '2kHz', '4kHz', '8kHz', '16kHz'];
const VOICE_BEAUTIFIER_NAMES = ['清澈', '剧场', 'CD', '录音棚'];
const VOICE_BEAUTIFIER_OPTIONS: SelectOption[] = [
  { value: '清澈' }, { value: '剧场' }, { value: 'CD' }, { value: '录音棚' }
];
const SOUND_FIELD_NAMES = ['前向', '宏大', '近场', '宽广'];
const SOUND_FIELD_OPTIONS: SelectOption[] = [
  { value: '前向' }, { value: '宏大' }, { value: '近场' }, { value: '宽广' }
];
const ENVIRONMENT_NAMES = ['广播', '听筒', '水下', '留声机'];
const ENVIRONMENT_OPTIONS: SelectOption[] = [
  { value: '广播' }, { value: '听筒' }, { value: '水下' }, { value: '留声机' }
];
const PURE_VOICE_GENDER_NAMES = ['女声', '男声'];
const PURE_VOICE_GENDER_OPTIONS: SelectOption[] = [{ value: '女声' }, { value: '男声' }];
const PURE_VOICE_TYPE_NAMES = ['卡通', '可爱', '女声', '男声', '怪兽', '机器人', '沧桑'];
const PURE_VOICE_TYPE_OPTIONS: SelectOption[] = [
  { value: '卡通' }, { value: '可爱' }, { value: '女声' }, { value: '男声' },
  { value: '怪兽' }, { value: '机器人' }, { value: '沧桑' }
];
const GENERAL_VOICE_CHANGE_NAMES = ['可爱', '赛博朋克', '女声', '男声', '混声', '怪兽', '沧桑', '合成', '颤音', '战争'];
const GENERAL_VOICE_CHANGE_OPTIONS: SelectOption[] = [
  { value: '可爱' }, { value: '赛博朋克' }, { value: '女声' }, { value: '男声' },
  { value: '混声' }, { value: '怪兽' }, { value: '沧桑' }, { value: '合成' },
  { value: '颤音' }, { value: '战争' }
];
const SURROUND_DIRECTION_NAMES = ['逆时针', '顺时针'];
const SURROUND_DIRECTION_OPTIONS: SelectOption[] = [{ value: '逆时针' }, { value: '顺时针' }];
const SPACE_RENDER_MODE_NAMES = ['位置', '旋转', '扩展'];
const SPACE_RENDER_MODE_OPTIONS: SelectOption[] = [
  { value: '位置' }, { value: '旋转' }, { value: '扩展' }
];
const EFFECT_TYPE_NAMES = [
  '均衡器效果', '声音美化效果', '降噪效果', '声场效果', '环境效果',
  '空间渲染效果', '传统变声效果', '通用变声效果', '变速变调效果'
];
const EFFECT_TYPE_OPTIONS: SelectOption[] = [
  { value: '均衡器效果' }, { value: '声音美化效果' }, { value: '降噪效果' },
  { value: '声场效果' }, { value: '环境效果' }, { value: '空间渲染效果' },
  { value: '传统变声效果' }, { value: '通用变声效果' }, { value: '变速变调效果' }
];

@Entry
@Component
struct Index {
  @State message: string = 'Ready';
  @State napiReturnLog: string = '暂无返回信息';
  @State isPlay: boolean = false;
  @State type: number = 1;
  // Loading 状态
  @State isLoadingBaseEditor: boolean = false;
  @State isLoadingAudioSourceSeparation: boolean = false;
  @State isLoadingMixingAndCascading: boolean = false;
  @State isLoadingAudioFormatConverter: boolean = false;
  // 效果完成状态
  @State isBaseEditorCompleted: boolean = false;
  @State isAudioSourceSeparationCompleted: boolean = false;
  @State isMixingAndCascadingCompleted: boolean = false;
  @State isAudioFormatConverterCompleted: boolean = false;

  @State effectType: number = 0;
  @State eqPresetIndex: number = 0;
  @State eqGains: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  @State voiceBeautifierType: number = 1;
  @State soundFieldType: number = 1;
  @State environmentType: number = 1;
  @State generalVoiceChangeType: number = 1;
  @State pureVoiceChangeGender: number = 1;
  @State pureVoiceChangeType: number = 1;
  @State pureVoiceChangePitch: number = 0;
  @State tempoSpeed: number = 1.0;
  @State tempoPitch: number = 1.0;
  @State spacePositionX: number = 0;
  @State spacePositionY: number = 0;
  @State spacePositionZ: number = 0;
  @State spaceRotationX: number = 0;
  @State spaceRotationY: number = 0;
  @State spaceRotationZ: number = 0;
  @State spaceRotationSurroundTime: number = 10;
  @State spaceRotationSurroundDirection: number = 0;
  @State spaceExtensionRadius: number = 2.0;
  @State spaceExtensionAngle: number = 180;
  @State spaceRenderMode: number = 0;
  @State showEffectDialog: boolean = false;
  @State dialogEffectType: number = 0;
  @State dialogEqPresetIndex: number = 0;
  @State dialogEqGains: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  @State dialogVoiceBeautifierType: number = 1;
  @State dialogSoundFieldType: number = 1;
  @State dialogEnvironmentType: number = 1;
  @State dialogGeneralVoiceChangeType: number = 1;
  @State dialogPureVoiceChangeGender: number = 1;
  @State dialogPureVoiceChangeType: number = 1;
  @State dialogPureVoiceChangePitch: number = 0;
  @State dialogTempoSpeed: number = 1.0;
  @State dialogTempoPitch: number = 1.0;
  @State dialogSpacePositionX: number = 0;
  @State dialogSpacePositionY: number = 0;
  @State dialogSpacePositionZ: number = 0;
  @State dialogSpaceRotationX: number = 0;
  @State dialogSpaceRotationY: number = 0;
  @State dialogSpaceRotationZ: number = 0;
  @State dialogSpaceRotationSurroundTime: number = 10;
  @State dialogSpaceRotationSurroundDirection: number = 0;
  @State dialogSpaceExtensionRadius: number = 2.0;
  @State dialogSpaceExtensionAngle: number = 180;
  @State dialogSpaceRenderMode: number = 0;

  // 更新NAPI返回信息
  updateNapiLog(msg: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.napiReturnLog = `[${timestamp}]\n${msg}`;
  }

  aboutToAppear() {
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    let value = context.resourceManager.getRawFileContentSync("S16LE_2_48000.pcm");
    let myBuffer: ArrayBufferLike = value?.buffer;
    let filePath = context.filesDir + "/" + "S16LE_2_48000.pcm";
    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, myBuffer);
    fs.closeSync(file);
  }

  build() {
    Stack() {
      Column() {
        NavDestination() {
          Column() {
            // 信息显示区域 - 固定在顶部
            Column() {
              Text('实时状态信息')
                .fontSize(18)
                .fontWeight(600)
                .margin({ bottom: 12 })

              // 当前状态
              Column() {
                Text('当前状态')
                  .fontSize(14)
                  .fontWeight(600)
                  .margin({ bottom: 8 })
                Text(this.message)
                  .fontSize(14)
                  .fontColor('#007DFF')
                  .width('100%')
                  .padding(10)
                  .backgroundColor('#F0F0F0')
                  .borderRadius(8)
              }
              .width('100%')
              .alignItems(HorizontalAlign.Start)
              .margin({ bottom: 12 })

              // NAPI返回信息
              Column() {
                Text('NAPI返回信息')
                  .fontSize(14)
                  .fontWeight(600)
                  .margin({ bottom: 8 })
                Scroll() {
                  Text(this.napiReturnLog)
                    .fontSize(12)
                    .fontColor('#52C41A')
                    .width('100%')
                    .padding(10)
                    .backgroundColor('#F0F0F0')
                    .borderRadius(8)
                }
                .width('100%')
              }
              .width('100%')
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .margin({ bottom: 16 })

            // 按钮区域 - 可滚动
            Scroll() {
              Column() {
                // 创建播放流按钮
                Button('播放音频')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 1;
                      let result: string = await audioSuiteNapi.CreateAudioRender(1);
                      this.message = '播放原始音频成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放原始音频失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })
                // 销毁播放流按钮
                Button('停止播放')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(this.isPlay)
                  .onClick(async () => {
                    try {
                      this.isPlay = false;
                      let result: string = await audioSuiteNapi.DestroyAudioRender(this.type);
                      this.type = 1;
                      this.message = '停止播放成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '停止播放失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
})

                Button('添加音频效果')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .onClick(() => {
                    this.syncCommittedToDialog();
                    this.showEffectDialog = true;
                  })

                Button('播放添加音频效果后音频')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay && this.isBaseEditorCompleted)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 1;
                      let result: string = await audioSuiteNapi.CreateAudioRender(2);
                      this.message = '播放添加音频效果后音频成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放添加音频效果后音频失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('音源分离')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .onClick(() => {
                    try {
                      this.message = '正在进行音源分离...';
                      this.isLoadingAudioSourceSeparation = true;
                      audioSuiteNapi.AudioSourceSeparationNapi((result: string) => {
                        this.isLoadingAudioSourceSeparation = false;
                        this.isAudioSourceSeparationCompleted = true;
                        this.message = '音源分离成功';
                        this.updateNapiLog(result);
                      });
                    } catch (err) {
                      this.isLoadingAudioSourceSeparation = false;
                      this.message = '音源分离失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('播放伴奏')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay && this.isAudioSourceSeparationCompleted)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 1;
                      let result: string = await audioSuiteNapi.CreateAudioRender(3);
                      this.message = '播放伴奏成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放伴奏失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('播放人声')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay && this.isAudioSourceSeparationCompleted)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 1;
                      let result: string = await audioSuiteNapi.CreateAudioRender(4);
                      this.message = '播放人声成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放人声失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('混音与级联')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(this.isAudioSourceSeparationCompleted)
                  .onClick(() => {
                    try {
                      this.message = '正在进行混音与级联...';
                      this.isLoadingMixingAndCascading = true;
                      audioSuiteNapi.MixingAndCascadingNapi((result: string) => {
                        this.isLoadingMixingAndCascading = false;
                        this.isMixingAndCascadingCompleted = true;
                        this.message = '混音与级联成功';
                        this.updateNapiLog(result);
                      });
                    } catch (err) {
                      this.isLoadingMixingAndCascading = false;
                      this.message = '混音与级联失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('播放混音')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay && this.isMixingAndCascadingCompleted)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 1;
                      let result: string = await audioSuiteNapi.CreateAudioRender(5);
                      this.message = '播放混音成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放混音失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('播放实时预览')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 2;
                      let result: string = await audioSuiteNapi.EqualizerEffectNapi();
                      this.message = '播放实时预览成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放实时预览失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('播放空间渲染')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay && this.isAudioSourceSeparationCompleted)
                  .onClick(async () => {
                    try {
                      this.isPlay = true;
                      this.type = 3;
                      let result: string = await audioSuiteNapi.SpaceRenderRotationNapi();
                      this.message = '播放空间渲染成功';
                      this.updateNapiLog(result);
                    } catch (err) {
                      this.message = '播放空间渲染失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('调试')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(this.type == 2)
                  .backgroundColor(this.type == 2 ? '#8B0000' : '#CCCCCC')
                  .onClick(async () => {
                    try {
                      await DirInitHelper.ensureDirExists();
                      let ret = audioSuiteNapi.TestPrintInfoToFile();
                      this.message = ret ? 'PrintInfo测试成功' : 'PrintInfo测试失败';
                      this.updateNapiLog(ret ? 'PrintInfo已输出到文件' : 'PrintInfo输出失败');
                    } catch (err) {
                      this.message = 'PrintInfo测试失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })

                Button('格式转换')
                  .width('90%')
                  .height(30)
                  .margin({ bottom: 12 })
                  .enabled(!this.isPlay)
                  .onClick(() => {
                    try {
                      this.message = '正在进行格式转换...';
                      this.isLoadingAudioFormatConverter = true;
                      audioSuiteNapi.AudioFormatConverterNapi((result: string) => {
                        this.isLoadingAudioFormatConverter = false;
                        this.isAudioFormatConverterCompleted = true;
                        this.message = '格式转换成功';
                        this.updateNapiLog(result);
                      });
                    } catch (err) {
                      this.isLoadingAudioFormatConverter = false;
                      this.message = '格式转换失败';
                      this.updateNapiLog('错误: ' + JSON.stringify(err));
                    }
                  })
              }
              .width('100%')
              .padding({ left: 16, right: 16 })
              .alignItems(HorizontalAlign.Center)
            }
            .width('100%')
            .layoutWeight(1)
            .scrollable(ScrollDirection.Vertical)
            .scrollBar(BarState.Auto)
            .edgeEffect(EdgeEffect.Spring)
          }
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .height('100%')

        // Loading 遮罩层
        if (this.isLoadingBaseEditor || this.isLoadingAudioSourceSeparation || this.isLoadingMixingAndCascading || this.isLoadingAudioFormatConverter) {
          Column() {
            LoadingProgress()
              .width(40)
              .height(40)
              .color('#007DFF')
              .margin({ bottom: 12 })

            Text(this.isLoadingBaseEditor ? '正在添加音频效果...' :
              this.isLoadingAudioSourceSeparation ? '正在进行音源分离...' :
                this.isLoadingMixingAndCascading ? '正在进行混音与级联...' : '处理中...')
              .fontSize(16)
              .fontColor('#FFFFFF')
          }
          .width('100%')
          .height('100%')
          .position({ x: 0, y: 0 })
          .justifyContent(FlexAlign.Center)
          .backgroundColor('rgba(0, 0, 0, 0.6)')
          .zIndex(999)
        }

        if (this.isLoadingBaseEditor || this.isLoadingAudioSourceSeparation || this.isLoadingMixingAndCascading || this.isLoadingAudioFormatConverter) {
          Column() {
            LoadingProgress()
              .width(40)
              .height(40)
              .color('#007DFF')
              .margin({ bottom: 12 })

            Text(this.isLoadingBaseEditor ? '正在添加音频效果...' :
              this.isLoadingAudioSourceSeparation ? '正在进行音源分离...' :
                this.isLoadingMixingAndCascading ? '正在进行混音与级联...' : '处理中...')
              .fontSize(16)
              .fontColor('#FFFFFF')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('rgba(0, 0, 0, 0.6)')
        }

        // 效果设置弹窗
        if (this.showEffectDialog) {
          Column() {
            Text('音频效果设置')
              .fontSize(18)
              .fontWeight(600)
              .margin({ bottom: 16 })

            Text('效果类型')
              .fontSize(14)
              .fontWeight(500)
              .margin({ bottom: 8 })
            Select(EFFECT_TYPE_OPTIONS)
              .selected(this.dialogEffectType)
              .value(EFFECT_TYPE_NAMES[this.dialogEffectType])
              .width('100%')
              .onSelect((index: number) => {
                this.dialogEffectType = index;
                if (index === 0) {
                  this.dialogEqPresetIndex = 0;
                  this.dialogEqGains = EQ_PRESET_VALUES[1].slice();
                }
              })

            if (this.dialogEffectType === 0) {
              Text('预置效果')
                .fontSize(14)
                .fontWeight(500)
                .margin({ top: 12, bottom: 8 })
              Select(EQ_PRESET_OPTIONS)
                .selected(this.dialogEqPresetIndex === -1 ? 0 : this.dialogEqPresetIndex + 1)
                .value(EQ_PRESET_NAMES[this.dialogEqPresetIndex === -1 ? 0 : this.dialogEqPresetIndex + 1])
                .width('100%')
                .onSelect((index: number) => {
                  this.dialogEqPresetIndex = index === 0 ? -1 : index - 1;
                  this.dialogEqGains = EQ_PRESET_VALUES[index].slice();
                })

              Text('频带增益设置')
                .fontSize(14)
                .fontWeight(500)
                .margin({ top: 12, bottom: 8 })
              Scroll() {
                Column() {
                  ForEach(EQ_BAND_LABELS, (label: string, index: number) => {
                    Row() {
                      Text(label)
                        .fontSize(12)
                        .width('20%')
                      Slider({
                        value: this.dialogEqGains[index],
                        min: -10,
                        max: 10,
                        step: 1,
                        style: SliderStyle.OutSet
                      })
                        .width('50%')
                        .blockColor('#007DFF')
                        .trackColor('#CCCCCC')
                        .selectedColor('#007DFF')
                        .onChange((value: number) => {
                          this.dialogEqGains[index] = Math.round(value);
                          this.dialogEqPresetIndex = -1;
                        })
                      Text(`${this.dialogEqGains[index]} dB`)
                        .fontSize(12)
                        .width('30%')
                        .textAlign(TextAlign.Center)
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                    .margin({ bottom: 4 })
                  }, (label: string) => label)
                }
                .width('100%')
              }
              .width('100%')
              .height(150)
              .scrollable(ScrollDirection.Vertical)
              .scrollBar(BarState.Auto)
            }

            if (this.dialogEffectType === 1) {
              Text('美化效果类型')
                .fontSize(14)
                .fontWeight(500)
                .margin({ top: 12, bottom: 8 })
              Select(VOICE_BEAUTIFIER_OPTIONS)
                .selected(this.dialogVoiceBeautifierType - 1)
                .value(VOICE_BEAUTIFIER_NAMES[this.dialogVoiceBeautifierType - 1])
                .width('100%')
                .onSelect((index: number) => {
                  this.dialogVoiceBeautifierType = index + 1;
                })
            }

            if (this.dialogEffectType === 2) {
              Text('降噪效果无需配置参数，点击确定即应用。')
                .fontSize(13)
                .fontColor('#666666')
                .margin({ top: 16 })
            }

            if (this.dialogEffectType === 3) {
              Text('声场类型')
                .fontSize(14)
                .fontWeight(500)
                .margin({ top: 12, bottom: 8 })
              Select(SOUND_FIELD_OPTIONS)
                .selected(this.dialogSoundFieldType - 1)
                .value(SOUND_FIELD_NAMES[this.dialogSoundFieldType - 1])
                .width('100%')
                .onSelect((index: number) => {
                  this.dialogSoundFieldType = index + 1;
                })
            }

            if (this.dialogEffectType === 4) {
              Text('环境场景类型')
                .fontSize(14)
                .fontWeight(500)
                .margin({ top: 12, bottom: 8 })
              Select(ENVIRONMENT_OPTIONS)
                .selected(this.dialogEnvironmentType - 1)
                .value(ENVIRONMENT_NAMES[this.dialogEnvironmentType - 1])
                .width('100%')
                .onSelect((index: number) => {
                  this.dialogEnvironmentType = index + 1;
                })
            }

            if (this.dialogEffectType === 5) {
              Text('空间渲染场景')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Select(SPACE_RENDER_MODE_OPTIONS)
                .selected(this.dialogSpaceRenderMode)
                .value(SPACE_RENDER_MODE_NAMES[this.dialogSpaceRenderMode])
                .width('100%')
                .onSelect((index: number) => { this.dialogSpaceRenderMode = index; })

              if (this.dialogSpaceRenderMode === 0) {
                Text('位置参数（x/y/z 范围 -5.0~5.0）')
                  .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('X').fontSize(12).width('10%')
                Slider({ value: this.dialogSpacePositionX, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpacePositionX = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpacePositionX}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('Y').fontSize(12).width('10%')
                Slider({ value: this.dialogSpacePositionY, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpacePositionY = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpacePositionY}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('Z').fontSize(12).width('10%')
                Slider({ value: this.dialogSpacePositionZ, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpacePositionZ = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpacePositionZ}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              }

              if (this.dialogSpaceRenderMode === 1) {
              Text('旋转参数（x/y/z 范围 -5.0~5.0）')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('X').fontSize(12).width('10%')
                Slider({ value: this.dialogSpaceRotationX, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceRotationX = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpaceRotationX}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('Y').fontSize(12).width('10%')
                Slider({ value: this.dialogSpaceRotationY, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceRotationY = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpaceRotationY}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('Z').fontSize(12).width('10%')
                Slider({ value: this.dialogSpaceRotationZ, min: -5, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('70%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceRotationZ = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpaceRotationZ}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('环绕时间').fontSize(12).width('30%')
                Slider({ value: this.dialogSpaceRotationSurroundTime, min: 2, max: 40, step: 1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceRotationSurroundTime = Math.round(v); })
                Text(`${this.dialogSpaceRotationSurroundTime}s`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('环绕方向').fontSize(12).width('30%')
                Select(SURROUND_DIRECTION_OPTIONS)
                  .selected(this.dialogSpaceRotationSurroundDirection)
                  .value(SURROUND_DIRECTION_NAMES[this.dialogSpaceRotationSurroundDirection])
                  .width('70%')
                  .onSelect((index: number) => { this.dialogSpaceRotationSurroundDirection = index; })
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              }

              if (this.dialogSpaceRenderMode === 2) {
              Text('扩展参数（半径 1.0~5.0；角度 0~360）')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('半径').fontSize(12).width('30%')
                Slider({ value: this.dialogSpaceExtensionRadius, min: 1, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceExtensionRadius = Math.round(v * 10) / 10; })
                Text(`${this.dialogSpaceExtensionRadius}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Row() {
                Text('角度').fontSize(12).width('30%')
                Slider({ value: this.dialogSpaceExtensionAngle, min: 0, max: 360, step: 1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogSpaceExtensionAngle = Math.round(v); })
                Text(`${this.dialogSpaceExtensionAngle}°`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
              }
            }

            if (this.dialogEffectType === 6) {
              Text('说话人性别')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Select(PURE_VOICE_GENDER_OPTIONS)
                .selected(this.dialogPureVoiceChangeGender - 1)
                .value(PURE_VOICE_GENDER_NAMES[this.dialogPureVoiceChangeGender - 1])
                .width('100%')
                .onSelect((index: number) => { this.dialogPureVoiceChangeGender = index + 1; })
              Text('变声类型')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Select(PURE_VOICE_TYPE_OPTIONS)
                .selected(this.dialogPureVoiceChangeType - 1)
                .value(PURE_VOICE_TYPE_NAMES[this.dialogPureVoiceChangeType - 1])
                .width('100%')
                .onSelect((index: number) => { this.dialogPureVoiceChangeType = index + 1; })
              Text('音高（0=系统推荐，范围 0.3~3.0）')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('pitch').fontSize(12).width('30%')
                Slider({ value: this.dialogPureVoiceChangePitch, min: 0, max: 3, step: 0.1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogPureVoiceChangePitch = Math.round(v * 10) / 10; })
                Text(`${this.dialogPureVoiceChangePitch}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            }

            if (this.dialogEffectType === 7) {
              Text('通用变声类型')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Select(GENERAL_VOICE_CHANGE_OPTIONS)
                .selected(this.dialogGeneralVoiceChangeType - 1)
                .value(GENERAL_VOICE_CHANGE_NAMES[this.dialogGeneralVoiceChangeType - 1])
                .width('100%')
                .onSelect((index: number) => { this.dialogGeneralVoiceChangeType = index + 1; })
            }

            if (this.dialogEffectType === 8) {
              Text('速度 speed（范围 0.5~10.0）')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('speed').fontSize(12).width('30%')
                Slider({ value: this.dialogTempoSpeed, min: 0.5, max: 10, step: 0.1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogTempoSpeed = Math.round(v * 10) / 10; })
                Text(`${this.dialogTempoSpeed}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ bottom: 4 })
              Text('音高 pitch（范围 0.1~5.0）')
                .fontSize(14).fontWeight(500).margin({ top: 12, bottom: 8 })
              Row() {
                Text('pitch').fontSize(12).width('30%')
                Slider({ value: this.dialogTempoPitch, min: 0.1, max: 5, step: 0.1, style: SliderStyle.OutSet })
                  .width('50%').blockColor('#007DFF').selectedColor('#007DFF')
                  .onChange((v: number) => { this.dialogTempoPitch = Math.round(v * 10) / 10; })
                Text(`${this.dialogTempoPitch}`).fontSize(12).width('20%').textAlign(TextAlign.Center)
              }.width('100%').justifyContent(FlexAlign.SpaceBetween)
            }

            Row() {
              Button('取消')
                .width('45%')
                .height(36)
                .backgroundColor('#CCCCCC')
                .onClick(() => {
                  this.showEffectDialog = false;
                })

              Button('确定')
                .width('45%')
                .height(36)
                .onClick(() => {
                  this.commitDialogToCommitted();
                  this.showEffectDialog = false;
                  this.applyEffect();
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ top: 20 })
          }
          .width('85%')
          .padding(20)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .position({ x: '7.5%', y: '50%' })
          .translate({ y: '-50%' })
          .zIndex(1000)
        }

        // 弹窗背景遮罩
        if (this.showEffectDialog) {
          Column()
            .width('100%')
            .height('100%')
            .position({ x: 0, y: 0 })
            .backgroundColor('rgba(0, 0, 0, 0.4)')
            .zIndex(999)
            .onClick(() => {
              this.showEffectDialog = false;
            })
        }
      }
      .width('100%')
      .height('100%')
    }
  }

  syncCommittedToDialog() {
    this.dialogEffectType = this.effectType;
    this.dialogEqPresetIndex = this.eqPresetIndex;
    this.dialogEqGains = this.eqGains.slice();
    this.dialogVoiceBeautifierType = this.voiceBeautifierType;
    this.dialogSoundFieldType = this.soundFieldType;
    this.dialogEnvironmentType = this.environmentType;
    this.dialogGeneralVoiceChangeType = this.generalVoiceChangeType;
    this.dialogPureVoiceChangeGender = this.pureVoiceChangeGender;
    this.dialogPureVoiceChangeType = this.pureVoiceChangeType;
    this.dialogPureVoiceChangePitch = this.pureVoiceChangePitch;
    this.dialogTempoSpeed = this.tempoSpeed;
    this.dialogTempoPitch = this.tempoPitch;
    this.dialogSpacePositionX = this.spacePositionX;
    this.dialogSpacePositionY = this.spacePositionY;
    this.dialogSpacePositionZ = this.spacePositionZ;
    this.dialogSpaceRotationX = this.spaceRotationX;
    this.dialogSpaceRotationY = this.spaceRotationY;
    this.dialogSpaceRotationZ = this.spaceRotationZ;
    this.dialogSpaceRotationSurroundTime = this.spaceRotationSurroundTime;
    this.dialogSpaceRotationSurroundDirection = this.spaceRotationSurroundDirection;
    this.dialogSpaceExtensionRadius = this.spaceExtensionRadius;
    this.dialogSpaceExtensionAngle = this.spaceExtensionAngle;
    this.dialogSpaceRenderMode = this.spaceRenderMode;
  }

  commitDialogToCommitted() {
    this.effectType = this.dialogEffectType;
    this.eqPresetIndex = this.dialogEqPresetIndex;
    this.eqGains = this.dialogEqGains.slice();
    this.voiceBeautifierType = this.dialogVoiceBeautifierType;
    this.soundFieldType = this.dialogSoundFieldType;
    this.environmentType = this.dialogEnvironmentType;
    this.generalVoiceChangeType = this.dialogGeneralVoiceChangeType;
    this.pureVoiceChangeGender = this.dialogPureVoiceChangeGender;
    this.pureVoiceChangeType = this.dialogPureVoiceChangeType;
    this.pureVoiceChangePitch = this.dialogPureVoiceChangePitch;
    this.tempoSpeed = this.dialogTempoSpeed;
    this.tempoPitch = this.dialogTempoPitch;
    this.spacePositionX = this.dialogSpacePositionX;
    this.spacePositionY = this.dialogSpacePositionY;
    this.spacePositionZ = this.dialogSpacePositionZ;
    this.spaceRotationX = this.dialogSpaceRotationX;
    this.spaceRotationY = this.dialogSpaceRotationY;
    this.spaceRotationZ = this.dialogSpaceRotationZ;
    this.spaceRotationSurroundTime = this.dialogSpaceRotationSurroundTime;
    this.spaceRotationSurroundDirection = this.dialogSpaceRotationSurroundDirection;
    this.spaceExtensionRadius = this.dialogSpaceExtensionRadius;
    this.spaceExtensionAngle = this.dialogSpaceExtensionAngle;
    this.spaceRenderMode = this.dialogSpaceRenderMode;
  }

  buildEffectParams(): audioSuiteNapi.EffectParams {
    let params: audioSuiteNapi.EffectParams = {};
    if (this.effectType === 0) {
      params.eqPresetIndex = this.eqPresetIndex;
      params.eqGains = this.eqGains;
    } else if (this.effectType === 1) {
      params.voiceBeautifierType = this.voiceBeautifierType;
    } else if (this.effectType === 3) {
      params.soundFieldType = this.soundFieldType;
    } else if (this.effectType === 4) {
      params.environmentType = this.environmentType;
    } else if (this.effectType === 5) {
      this.fillSpaceRenderParams(params);
    } else if (this.effectType === 6) {
      params.pureVoiceChangeGender = this.pureVoiceChangeGender;
      params.pureVoiceChangeType = this.pureVoiceChangeType;
      params.pureVoiceChangePitch = this.pureVoiceChangePitch;
    } else if (this.effectType === 7) {
      params.generalVoiceChangeType = this.generalVoiceChangeType;
    } else if (this.effectType === 8) {
      params.tempoSpeed = this.tempoSpeed;
      params.tempoPitch = this.tempoPitch;
    }
    return params;
  }

  fillSpaceRenderParams(params: audioSuiteNapi.EffectParams) {
    params.spaceRenderMode = this.spaceRenderMode;
    params.spacePositionX = this.spacePositionX;
    params.spacePositionY = this.spacePositionY;
    params.spacePositionZ = this.spacePositionZ;
    params.spaceRotationX = this.spaceRotationX;
    params.spaceRotationY = this.spaceRotationY;
    params.spaceRotationZ = this.spaceRotationZ;
    params.spaceRotationSurroundTime = this.spaceRotationSurroundTime;
    params.spaceRotationSurroundDirection = this.spaceRotationSurroundDirection;
    params.spaceExtensionRadius = this.spaceExtensionRadius;
    params.spaceExtensionAngle = this.spaceExtensionAngle;
  }

  applyEffect() {
    try {
      this.message = '正在添加音频效果...';
      this.isLoadingBaseEditor = true;
      let params = this.buildEffectParams();
      audioSuiteNapi.BaseEditor(this.effectType, params, (result: string) => {
        this.isLoadingBaseEditor = false;
        this.isBaseEditorCompleted = true;
        this.message = '添加音频效果成功';
        this.updateNapiLog(result);
      });
    } catch (err) {
      this.isLoadingBaseEditor = false;
      this.message = '添加音频效果失败';
      this.updateNapiLog('错误: ' + JSON.stringify(err));
    }
  }
}