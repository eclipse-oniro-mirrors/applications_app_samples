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
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
import noiseReduction from 'libentry.so';
import { router } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { ensureMicrophonePermission } from '../utils/MicPermissionUtil';

const TAG = 'Tag_SimpleExample';

@Entry
@Component
struct NoiseReductionSimpleExample {
  @State jsState: string = 'Not created';
  @State jsMode: string = 'Unknown';
  @State jsSupportedModes: string = 'Unknown';
  @State jsCallbackLogList: string[] = [];
  @State jsCallbackRegistered: boolean = false;
  @State cState: string = 'Not created';
  @State cMode: string = 'Unknown';
  @State cCallbackLogList: string[] = [];
  @State cCallbackRegistered: boolean = false;
  @State selectedSource: number = 0;

  private cStreamId: number = -1;
  private audioCapturer: audio.AudioCapturer | null = null;
  private noiseReductionCallback: ((info: audio.NoiseReductionModeChangeInfo) => void) | null = null;
  private pollTimer: number = -1;

  private sourceTypes: string[] = ['LIVE', 'MIC', 'CAMCORDER', 'VOICE_COMMUNICATION'];
  private modeNames: Record<number, string> = { 0: 'FIDELITY', 1: 'PURE_VOCALS', 2: 'STANDARD' };

  private sourceMap: Record<number, audio.SourceType> = {
    0: audio.SourceType.SOURCE_TYPE_LIVE,
    1: audio.SourceType.SOURCE_TYPE_MIC,
    2: audio.SourceType.SOURCE_TYPE_CAMCORDER,
    3: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
  };

  // Create capturer.
  async jsCreate(): Promise<void> {
    const context = getContext(this) as common.UIAbilityContext;
    const granted = await ensureMicrophonePermission(context);
    if (!granted) {
      this.jsState = 'Failed: mic permission denied';
      return;
    }
    try {
      const options: audio.AudioCapturerOptions = {
        streamInfo: {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        },
        capturerInfo: {
          source: this.sourceMap[this.selectedSource],
          capturerFlags: 0,
        },
      };
      this.audioCapturer = await audio.createAudioCapturer(options);
      this.jsState = 'Created';
      console.info(`${TAG}: JS capturer created`);
    } catch (err) {
      const error = err as BusinessError;
      this.jsState = `Failed: ${error.code}`;
    }
  }

  // Start.
  async jsStart(): Promise<void> {
    if (!this.audioCapturer) {
      return;
    }
    try {
      await this.audioCapturer.start();
      this.jsState = 'Running';
    } catch (err) {
      const error = err as BusinessError;
      this.jsState = `Failed: ${error.code}`;
    }
  }

  // Stop.
  async jsStop(): Promise<void> {
    if (!this.audioCapturer) {
      return;
    }
    try {
      await this.audioCapturer.stop();
      this.jsState = 'Stopped';
    } catch (err) {
      const error = err as BusinessError;
      this.jsState = `Failed: ${error.code}`;
    }
  }

  // Set noise reduction mode.
  jsSetMode(mode: audio.NoiseReductionMode): void {
    if (!this.audioCapturer) {
      return;
    }
    try {
      this.audioCapturer.setNoiseReductionMode(mode);
      this.jsMode = this.modeNames[mode] || `?${mode}`;
    } catch (err) {
      const error = err as BusinessError;
      this.jsMode = `Failed: ${error.code}`;
    }
  }

  // Get noise reduction mode.
  jsGetMode(): void {
    if (!this.audioCapturer) {
      return;
    }
    try {
      const mode = this.audioCapturer.getNoiseReductionMode();
      this.jsMode = this.modeNames[mode] || `?${mode}`;
    } catch (err) {
      const error = err as BusinessError;
      this.jsMode = `Failed: ${error.code}`;
    }
  }

  // Get supported noise reduction modes.
  jsGetSupportedModes(): void {
    if (!this.audioCapturer) {
      return;
    }
    try {
      const modes = this.audioCapturer.getSupportedNoiseReductionModes();
      this.jsSupportedModes = modes.map(m => this.modeNames[m] || `?${m}`).join(', ');
    } catch (err) {
      const error = err as BusinessError;
      this.jsSupportedModes = `Failed: ${error.code}`;
    }
  }

  // Register callback.
  jsRegisterCallback(): void {
    if (!this.audioCapturer || this.jsCallbackRegistered) {
      return;
    }
    this.noiseReductionCallback = (info: audio.NoiseReductionModeChangeInfo) => {
      const reasonNames: Record<number, string> = {
        0: 'USER_SETTING_BY_SYSTEM_RECORD_CONTROLLER', 1: 'APP_SETTING',
        2: 'DEVICE_CHANGE', 3: 'STREAM_CONCURRENCY',
      };
      const r = reasonNames[info.reason] || `?${info.reason}`;
      const m = this.modeNames[info.noiseReductionMode] || `?${info.noiseReductionMode}`;
      const ts = new Date().toLocaleTimeString();
      this.jsCallbackLogList = [`[${ts}] reason=${r}, mode=${m}`, ...this.jsCallbackLogList].slice(0, 20);
    };
    try {
      this.audioCapturer.onNoiseReductionModeChanged(this.noiseReductionCallback);
      this.jsCallbackRegistered = true;
      this.jsCallbackLogList = ['Registered'];
    } catch (err) {
      const error = err as BusinessError;
      this.jsCallbackLogList = [`Failed: ${error.code}`];
    }
  }

  // Unregister callback.
  jsUnregisterCallback(): void {
    if (!this.audioCapturer || !this.jsCallbackRegistered) {
      return;
    }
    try {
      this.audioCapturer.offNoiseReductionModeChanged(this.noiseReductionCallback!);
      this.jsCallbackRegistered = false;
      this.jsCallbackLogList = ['Unregistered', ...this.jsCallbackLogList].slice(0, 20);
    } catch (err) {
      const error = err as BusinessError;
      this.jsCallbackLogList = [`Failed: ${error.code}`];
    }
  }

  // Release.
  async jsRelease(): Promise<void> {
    if (!this.audioCapturer) {
      return;
    }
    try {
      if (this.jsCallbackRegistered) {
        this.audioCapturer.offNoiseReductionModeChanged();
        this.jsCallbackRegistered = false;
      }
      await this.audioCapturer.release();
      this.audioCapturer = null;
      this.jsState = 'Released';
      this.jsMode = 'Unknown';
      this.jsCallbackLogList = [];
    } catch (err) {
      const error = err as BusinessError;
      this.jsState = `Failed: ${error.code}`;
    }
  }

  // Create capturer.
  async cCreate(): Promise<void> {
    const context = getContext(this) as common.UIAbilityContext;
    const granted = await ensureMicrophonePermission(context);
    if (!granted) {
      this.cState = 'Failed: mic permission denied';
      return;
    }
    const sourceTypeMap: Record<number, number> = {
      0: 17,  // LIVE
      1: 0,   // MIC
      2: 13,  // CAMCORDER
      3: 7,   // VOICE_COMMUNICATION
    };
    const sourceType: number = sourceTypeMap[this.selectedSource] ?? 17;
    const id: number = noiseReduction.createCapturer(sourceType, 44100, 2, 1);
    this.cStreamId = id;
    this.cState = id > 0 ? 'Created' : 'Failed';
  }

  // Start.
  cStart(): void {
    if (this.cStreamId > 0) {
      const ok = noiseReduction.startCapturer(this.cStreamId);
      this.cState = ok ? 'Running' : 'Start Failed';
    }
  }

  // Stop.
  cStop(): void {
    if (this.cStreamId > 0) {
      const ok = noiseReduction.stopCapturer(this.cStreamId);
      this.cState = ok ? 'Stopped' : 'Stop Failed';
    }
  }

  // Set mode.
  cSetMode(mode: number): void {
    if (this.cStreamId <= 0) {
      return;
    }
    const ok = noiseReduction.setMode(this.cStreamId, mode);
    this.cMode = ok ? this.modeNames[mode] || `?${mode}` : 'Failed';
  }

  // Get mode.
  cGetMode(): void {
    if (this.cStreamId <= 0) {
      return;
    }
    const mode = noiseReduction.getCurrentMode(this.cStreamId);
    this.cMode = mode >= 0 ? this.modeNames[mode] || `?${mode}` : 'Failed';
  }

  // Register callback.
  cRegisterCallback(): void {
    if (this.cStreamId <= 0) {
      return;
    }
    const ok = noiseReduction.registerCallback(this.cStreamId);
    if (ok) {
      this.cCallbackRegistered = true;
      this.cCallbackLogList = ['Registered'];
      this.pollTimer = setInterval(() => {
        if (this.cCallbackRegistered) {
          const log: string = noiseReduction.getCallbackLog(this.cStreamId);
          if (log && log !== 'Registered' && log !== this.cCallbackLogList[0]) {
            const ts: string = new Date().toLocaleTimeString();
            this.cCallbackLogList = [`[${ts}] ${log}`, ...this.cCallbackLogList].slice(0, 20);
          }
        }
      }, 500);
    } else {
      this.cCallbackLogList = ['Failed'];
    }
  }

  // Unregister callback.
  cUnregisterCallback(): void {
    if (this.cStreamId <= 0) {
      return;
    }
    const ok = noiseReduction.unregisterCallback(this.cStreamId);
    if (ok) {
      this.cCallbackRegistered = false;
      this.cCallbackLogList = ['Unregistered', ...this.cCallbackLogList].slice(0, 20);
      if (this.pollTimer !== -1) {
        clearInterval(this.pollTimer);
        this.pollTimer = -1;
      }
    }
  }

  // Release.
  cRelease(): void {
    if (this.cCallbackRegistered) {
      noiseReduction.unregisterAllCallbacks(this.cStreamId);
      this.cCallbackRegistered = false;
    }
    if (this.pollTimer !== -1) {
      clearInterval(this.pollTimer);
      this.pollTimer = -1;
    }
    noiseReduction.releaseCapturer(this.cStreamId);
    this.cStreamId = -1;
    this.cState = 'Released';
    this.cMode = 'Unknown';
    this.cCallbackLogList = [];
  }

  aboutToDisappear(): void {
    if (this.pollTimer !== -1) {
      clearInterval(this.pollTimer);
      this.pollTimer = -1;
    }
    if (this.audioCapturer) {
      this.jsRelease();
    }
    if (this.cStreamId > 0) {
      this.cRelease();
    }
  }

  @Builder
  Title(text: string) {
    Text(text).fontSize(15).fontWeight(FontWeight.Medium).margin({ top: 10, bottom: 4 }).width('100%')
  }

  @Builder
  Btn(text: string, action: () => void, color: string = '#007DFF') {
    Button(text).height(30).fontSize(12).margin({ left: 3, right: 3 })
      .backgroundColor(color).fontColor('#FFF').onClick(() => action())
  }

  @Builder
  Info(label: string, value: string) {
    Row() {
      Text(label).fontSize(12).fontColor('#666').width('30%')
      Text(value).fontSize(12).width('70%')
    }.width('90%').margin({ top: 2, bottom: 2 })
  }

  build() {
    Scroll() {
      Column() {
        // 返回栏。
        Row() {
          Text($r('app.string.menu_back'))
            .fontSize(14)
            .fontColor('#007DFF')
            .onClick(() => router.back())
          Blank()
        }
        .width('100%')
        .margin({ top: 12, bottom: 4 })

        // Source type selector
        this.Title('Source Type')
        Row() {
          Text('SourceType').fontSize(12).fontColor('#666').width('25%')
          Select(this.sourceTypes.map((s: string): SelectOption => { return { value: s } }))
            .selected(this.selectedSource)
            .value(this.sourceTypes[this.selectedSource])
            .onSelect((i: number) => this.selectedSource = i)
            .width('70%')
        }.width('90%').margin({ bottom: 8 })

        // JS API section.
        this.Title('JS API')
        this.Info('State:', this.jsState)
        this.Info('Mode:', this.jsMode)
        this.Info('Supported:', this.jsSupportedModes)
        Row() {
          this.Btn('Create', () => this.jsCreate())
          this.Btn('Start', () => this.jsStart(), '#4CAF50')
          this.Btn('Stop', () => this.jsStop(), '#FF9800')
          this.Btn('Release', () => this.jsRelease(), '#F44336')
        }.width('100%').justifyContent(FlexAlign.Center)
        Row() {
          this.Btn('Set FIDELITY', () => this.jsSetMode(audio.NoiseReductionMode.FIDELITY))
          this.Btn('Set PURE_VOCALS', () => this.jsSetMode(audio.NoiseReductionMode.PURE_VOCALS))
          this.Btn('Set STANDARD', () => this.jsSetMode(audio.NoiseReductionMode.STANDARD))
        }.width('100%').justifyContent(FlexAlign.Center)
        Row() {
          this.Btn('Get Mode', () => this.jsGetMode(), '#607D8B')
          this.Btn('Get Supported', () => this.jsGetSupportedModes(), '#607D8B')
          this.Btn('Register', () => this.jsRegisterCallback())
          this.Btn('Unregister', () => this.jsUnregisterCallback())
        }.width('100%').justifyContent(FlexAlign.Center)
        if (this.jsCallbackLogList.length === 0) {
          this.Info('Callback:', 'No event')
        } else {
          this.Info('Callback:', this.jsCallbackLogList[0])
        }

        // C API section.
        this.Title('C API (via NAPI)')
        this.Info('State:', this.cState)
        this.Info('Mode:', this.cMode)
        Row() {
          this.Btn('Create', () => this.cCreate())
          this.Btn('Start', () => this.cStart(), '#4CAF50')
          this.Btn('Stop', () => this.cStop(), '#FF9800')
          this.Btn('Release', () => this.cRelease(), '#F44336')
        }.width('100%').justifyContent(FlexAlign.Center)
        Row() {
          this.Btn('Set FIDELITY', () => this.cSetMode(0))
          this.Btn('Set PURE_VOCALS', () => this.cSetMode(1))
          this.Btn('Set STANDARD', () => this.cSetMode(2))
        }.width('100%').justifyContent(FlexAlign.Center)
        Row() {
          this.Btn('Get Mode', () => this.cGetMode(), '#607D8B')
          this.Btn('Register', () => this.cRegisterCallback())
          this.Btn('Unregister', () => this.cUnregisterCallback())
        }.width('100%').justifyContent(FlexAlign.Center)
        if (this.cCallbackLogList.length === 0) {
          this.Info('Callback:', 'No event')
        } else {
          this.Info('Callback:', this.cCallbackLogList[0])
        }
      }
      .width('100%')
      .padding({ left: 12, right: 12 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }
}
