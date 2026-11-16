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
import noiseReduction from 'libentry.so';
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { router, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { ensureMicrophonePermission } from '../utils/MicPermissionUtil';
import { mediaquery } from '@kit.ArkUI';

const TAG = 'Tag_NR_Main';
const POLL_INTERVAL = 500;
const TITLE_BAR_HEIGHT = 44;
const MIN_DISPLAY_HEIGHT = 200;
interface StreamItem {
  id: number;
  sourceType: string;
  sourceTypeVal: number;
  samplingRate: number;
  channels: number;
  state: string;
  currentMode: string;
  supportedModes: string;
  callbackRegistered: boolean;
  isCApi: boolean;
  apiType: string;
  audioCapturer: audio.AudioCapturer | null;
}

@Entry
@Component
struct NoiseReductionMain {
  @State streamList: StreamItem[] = [];
  @State selectedStreamId: number = -1;
  @State operationLogList: string[] = [];
  @State currentTabIndex: number = 0;
  @StorageLink('apiMode') apiMode: string = 'C API';
  @StorageLink('logLimit') logLimit: number = 50;
  @State showParamDialog: boolean = false;
  @State isWideScreen: boolean = false;
  @State displayHeight: number = 0;
  private screenListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync('(min-width: 600vp)');
  private logScroller: Scroller = new Scroller();

  @State paramSourceType: number = 0;
  @State paramSamplingRate: number = 2;
  @State paramChannels: number = 1;

  private sourceTypes: string[] = ['LIVE', 'MIC', 'CAMCORDER', 'VOICE_COMMUNICATION'];
  private sourceTypeValsC: number[] = [17, 0, 13, 7];
  private sampleRates: number[] = [8000, 16000, 44100, 48000];
  private sampleRateNames: string[] = ['8000', '16000', '44100', '48000'];
  private channelsList: string[] = ['1ch', '2ch'];
  private modeNames: Record<number, string> = { 0: 'FIDELITY', 1: 'PURE_VOCALS', 2: 'STANDARD' };
  private pollTimer: number = -1;
  private nextId: number = 1;
  private lastCallbackLogs: Map<number, string> = new Map();

  private getString(resource: Resource): string {
    return getContext(this).resourceManager.getStringSync(resource.id);
  }

  private log(msg: string): void {
    const ts: string = new Date().toLocaleTimeString();
    const entry: string = `[${ts}] ${msg}`;
    this.operationLogList = [...this.operationLogList, entry].slice(-this.logLimit);
    console.info(`${TAG}: ${entry}`);
    setTimeout(() => {
      this.logScroller.scrollTo({ xOffset: 0, yOffset: 999999 });
    }, 50);
  }

  private getSelectedStream(): StreamItem | null {
    for (let item of this.streamList) {
      if (item.id === this.selectedStreamId) {
        return item;
      }
    }
    return null;
  }

  private selectedStreamLabel(): string {
    for (let item of this.streamList) {
      if (item.id === this.selectedStreamId) {
        return `#${item.id} ${item.sourceType} | ${item.samplingRate} | ${item.channels}ch | ${item.state}`;
      }
    }
    return getContext(this).resourceManager.getStringSync($r('app.string.main_no_stream').id);
  }

  private selectedStreamStatus(): string {
    for (let item of this.streamList) {
      if (item.id === this.selectedStreamId) {
        return `#${item.id} [${item.state}] ${this.getString($r('app.string.main_log_noise_reduction'))}:${item.currentMode}` +
          ` ${this.getString($r('app.string.main_log_supported'))}:${item.supportedModes}` +
          ` ${this.getString($r('app.string.main_log_callback'))}:${item.callbackRegistered ? this.getString($r('app.string.main_log_registered')) : this.getString($r('app.string.main_log_not_registered'))}`;
      }
    }
    return getContext(this).resourceManager.getStringSync($r('app.string.main_no_stream_selected').id);
  }

  private startPolling(): void {
    this.stopPolling();
    this.pollTimer = setInterval(() => {
      for (let item of this.streamList) {
        if (item.callbackRegistered && item.isCApi) {
          const log: string = noiseReduction.getCallbackLog(item.id);
          if (log && log !== 'Callback registered, waiting for events...' && log !== 'No callback event') {
            const lastLog = this.lastCallbackLogs.get(item.id);
            if (log !== lastLog) {
              this.lastCallbackLogs.set(item.id, log);
              this.log(`#${item.id} ${this.getString($r('app.string.main_log_callback'))} ${log}`);
            }
          }
        }
      }
    }, POLL_INTERVAL);
  }

  private stopPolling(): void {
    if (this.pollTimer !== -1) {
      clearInterval(this.pollTimer);
      this.pollTimer = -1;
    }
  }

  aboutToAppear(): void {
    this.isWideScreen = this.screenListener.matches;
    this.updateDisplayHeight();
    this.screenListener.on('change', (result: mediaquery.MediaQueryResult) => {
      this.isWideScreen = result.matches;
      this.updateDisplayHeight();
    });
  }

  private updateDisplayHeight(): void {
    window.getLastWindow(getContext(this)).then((win) => {
      const wpv = win.getWindowProperties().windowRect;
      const limitByMin = Math.min(wpv.width, wpv.height) - TITLE_BAR_HEIGHT;
      const limitByMax = Math.floor(Math.max(wpv.width, wpv.height) / 2) - TITLE_BAR_HEIGHT;
      this.displayHeight = Math.max(MIN_DISPLAY_HEIGHT, Math.min(limitByMin, limitByMax));
      setTimeout(() => {
        this.logScroller.scrollTo({ xOffset: 0, yOffset: 999999 });
      }, 100);
    }).catch((err: Error) => {
      console.error(`${TAG}: Failed to get window size: ${err.message}`);
    });
  }

  aboutToDisappear(): void {
    this.stopPolling();
  }

  async createCapturer(): Promise<void> {
    const sourceTypeName = this.sourceTypes[this.paramSourceType];
    const rate = this.sampleRates[this.paramSamplingRate];
    const ch = this.paramChannels + 1;
    this.log(`${this.getString($r('app.string.main_log_create_capturer'))} ${sourceTypeName} ${rate} ${ch}ch`);

    const context = getContext(this) as common.UIAbilityContext;
    const granted = await ensureMicrophonePermission(context);
    if (!granted) {
      this.log(this.getString($r('app.string.main_log_create_failed_permission')));
      return;
    }

    if (this.apiMode === 'C API') {
      const sourceVal = this.sourceTypeValsC[this.paramSourceType];
      const streamId: number = noiseReduction.createCapturer(sourceVal, rate, ch, 1);
      if (streamId > 0) {
        const item: StreamItem = {
          id: streamId, sourceType: sourceTypeName, sourceTypeVal: sourceVal,
          samplingRate: rate, channels: ch, state: getContext(this).resourceManager.getStringSync($r('app.string.main_stream_created').id),
          currentMode: getContext(this).resourceManager.getStringSync($r('app.string.main_not_queried').id), supportedModes: getContext(this).resourceManager.getStringSync($r('app.string.main_not_queried').id),
          callbackRegistered: false, isCApi: true, apiType: 'C API', audioCapturer: null
        };
        this.streamList = [...this.streamList, item];
        this.selectedStreamId = streamId;
        this.log(`#${streamId} createCapturer(C API) → streamId=${streamId}`);
        this.querySupportedModes(streamId);
        this.queryCurrentMode(streamId);
      } else {
        this.log(`createCapturer(C API) → ${this.getString($r('app.string.main_log_failed'))} streamId=${streamId}`);
      }
    } else {
      const sourceMap: Record<number, audio.SourceType> = {
        0: audio.SourceType.SOURCE_TYPE_LIVE,
        1: audio.SourceType.SOURCE_TYPE_MIC,
        2: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        3: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
      };
      const options: audio.AudioCapturerOptions = {
        streamInfo: {
          samplingRate: rate === 8000 ? audio.AudioSamplingRate.SAMPLE_RATE_8000 :
            rate === 16000 ? audio.AudioSamplingRate.SAMPLE_RATE_16000 :
            rate === 44100 ? audio.AudioSamplingRate.SAMPLE_RATE_44100 :
            audio.AudioSamplingRate.SAMPLE_RATE_48000,
          channels: ch === 1 ? audio.AudioChannel.CHANNEL_1 : audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        },
        capturerInfo: { source: sourceMap[this.paramSourceType], capturerFlags: 0 },
      };
      audio.createAudioCapturer(options).then((capturer: audio.AudioCapturer) => {
        const id = this.nextId++;
        const item: StreamItem = {
          id: id, sourceType: sourceTypeName, sourceTypeVal: 0,
          samplingRate: rate, channels: ch, state: getContext(this).resourceManager.getStringSync($r('app.string.main_stream_created').id),
          currentMode: getContext(this).resourceManager.getStringSync($r('app.string.main_not_queried').id), supportedModes: getContext(this).resourceManager.getStringSync($r('app.string.main_not_queried').id),
          callbackRegistered: false, isCApi: false, apiType: 'JS API', audioCapturer: capturer
        };
        this.streamList = [...this.streamList, item];
        this.selectedStreamId = id;
        this.log(`#${id} createAudioCapturer(JS API) → ${this.getString($r('app.string.main_log_success'))}`);
        this.querySupportedModes(id);
        this.queryCurrentMode(id);
      }).catch((err: BusinessError) => {
        this.log(`createAudioCapturer(JS API) → ${this.getString($r('app.string.main_log_failed'))}: ${err.code} ${err.message}`);
      });
    }
  }

  startCapturer(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      const ok = noiseReduction.startCapturer(id);
      this.log(`#${id} OH_AudioCapturer_Start(C API) → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.state = 'Running';
        this.streamList = [...this.streamList];
      }
    } else if (item.audioCapturer) {
      this.log(`#${id} audioCapturer.start(JS API) ${this.getString($r('app.string.main_log_starting'))}`);
      item.audioCapturer.start().then(() => {
        item.state = 'Running'; this.streamList = [...this.streamList];
        this.log(`#${id} audioCapturer.start(JS API) → success`);
      }).catch((err: BusinessError) => {
        this.log(`#${id} audioCapturer.start(JS API) → failed: ${err.code} ${err.message}`);
      });
    }
  }

  stopCapturer(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      const ok = noiseReduction.stopCapturer(id);
      this.log(`#${id} OH_AudioCapturer_Stop(C API) → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.state = 'Stopped';
        this.streamList = [...this.streamList];
      }
    } else if (item.audioCapturer) {
      item.audioCapturer.stop().then(() => {
        item.state = 'Stopped'; this.streamList = [...this.streamList];
        this.log(`#${id} audioCapturer.stop(JS API) → success`);
      }).catch((err: BusinessError) => {
        this.log(`#${id} audioCapturer.stop(JS API) → failed: ${err.code} ${err.message}`);
      });
    }
  }

  releaseCapturer(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      if (item.callbackRegistered) {
        noiseReduction.unregisterAllCallbacks(id);
        this.lastCallbackLogs.delete(id);
      }
      noiseReduction.releaseCapturer(id);
      this.streamList = this.streamList.filter(s => s.id !== id);
      this.log(`#${id} OH_AudioCapturer_Release(C API) → success`);
      if (this.selectedStreamId === id && this.streamList.length > 0) {
        this.selectedStreamId = this.streamList[0].id;
      } else if (this.streamList.length === 0) {
        this.selectedStreamId = -1;
      }
    } else if (item.audioCapturer) {
      if (item.callbackRegistered) {
        try {
          item.audioCapturer.offNoiseReductionModeChanged();
          this.log(`#${id} offNoiseReductionModeChanged(JS API) → success`);
        } catch (err) {
          const e = err as BusinessError;
          this.log(`#${id} offNoiseReductionModeChanged(JS API) → failed: ${e.code} ${e.message}`);
        }
      }
      item.audioCapturer.release().then(() => {
        this.streamList = this.streamList.filter(s => s.id !== id);
        this.log(`#${id} audioCapturer.release(JS API) → success`);
        if (this.selectedStreamId === id && this.streamList.length > 0) {
          this.selectedStreamId = this.streamList[0].id;
        } else if (this.streamList.length === 0) {
          this.selectedStreamId = -1;
        }
      }).catch((err: BusinessError) => { this.log(`#${id} Release ${this.getString($r('app.string.main_log_failed'))}: ${err.code} ${err.message}`); });
    }
  }

  querySupportedModes(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      const modes = noiseReduction.getSupportedModes(id);
      item.supportedModes = modes.map((m: number) => this.modeNames[m] || `?${m}`).join(',');
      this.streamList = [...this.streamList];
      this.log(`#${id} GetSupportedNoiseReductionModes(C API) → [${item.supportedModes}] (${modes.length} modes)`);
    } else if (item.audioCapturer) {
      try {
        const modes = item.audioCapturer.getSupportedNoiseReductionModes();
        item.supportedModes = modes.map((m: audio.NoiseReductionMode) => this.modeNames[m] || `?${m}`).join(',');
        this.streamList = [...this.streamList];
        this.log(`#${id} getSupportedNoiseReductionModes(JS API) → [${item.supportedModes}] (${modes.length} modes)`);
      } catch (err) {
        const e = err as BusinessError;
        this.log(`#${id} getSupportedNoiseReductionModes(JS API) → failed: ${e.code} ${e.message}`);
      }
    }
  }

  queryCurrentMode(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      const mode = noiseReduction.getCurrentMode(id);
      item.currentMode = mode >= 0 ? (this.modeNames[mode] || `?${mode}`) : getContext(this).resourceManager.getStringSync($r('app.string.main_query_failed').id);
      this.streamList = [...this.streamList];
      this.log(`#${id} GetNoiseReductionMode(C API) → ${item.currentMode} (raw=${mode})`);
    } else if (item.audioCapturer) {
      try {
        const mode = item.audioCapturer.getNoiseReductionMode();
        item.currentMode = this.modeNames[mode] || `?${mode}`;
        this.streamList = [...this.streamList];
        this.log(`#${id} getNoiseReductionMode(JS API) → ${item.currentMode} (raw=${mode})`);
      } catch (err) {
        const e = err as BusinessError;
        this.log(`#${id} getNoiseReductionMode(JS API) → failed: ${e.code} ${e.message}`);
      }
    }
  }

  setMode(id: number, mode: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    const modeName = this.modeNames[mode] || `?${mode}`;
    if (item.isCApi) {
      const ok = noiseReduction.setMode(id, mode);
      this.log(`#${id} SetNoiseReductionMode(C API) ${modeName} → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.currentMode = modeName;
        this.streamList = [...this.streamList];
      }
    } else if (item.audioCapturer) {
      try {
        item.audioCapturer.setNoiseReductionMode(mode as audio.NoiseReductionMode);
        item.currentMode = modeName; this.streamList = [...this.streamList];
        this.log(`#${id} setNoiseReductionMode(JS API) ${modeName} → success`);
      } catch (err) {
        const e = err as BusinessError;
        this.log(`#${id} setNoiseReductionMode(JS API) ${modeName} → failed: ${e.code} ${e.message}`);
      }
    }
  }

  registerCallback(id: number): void {
    const item = this.getStream(id);
    if (!item) {
      return;
    }
    if (item.isCApi) {
      const ok = noiseReduction.registerCallback(id);
      this.log(`#${id} RegisterNoiseReductionModeChangeCallback(C API) → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.callbackRegistered = true;
        this.streamList = [...this.streamList];
        this.startPolling();
      }
    } else if (item.audioCapturer) {
      const cb = (info: audio.NoiseReductionModeChangeInfo) => {
        const reasonNames: Record<number, string> = {
          0: 'USER_SETTING', 1: 'APP_SETTING', 2: 'DEVICE_CHANGE', 3: 'STREAM_CONCURRENCY',
        };
        const r = reasonNames[info.reason] || `?${info.reason}`;
        const m = this.modeNames[info.noiseReductionMode] || `?${info.noiseReductionMode}`;
        this.log(`#${id} onNoiseReductionModeChanged ${this.getString($r('app.string.main_log_callback'))} → reason=${r}, mode=${m}`);
      };
      try {
        item.audioCapturer.onNoiseReductionModeChanged(cb);
        item.callbackRegistered = true; this.streamList = [...this.streamList];
        this.log(`#${id} onNoiseReductionModeChanged(JS API) → ${this.getString($r('app.string.main_log_register_success'))}`);
      } catch (err) {
        const e = err as BusinessError;
        this.log(`#${id} onNoiseReductionModeChanged(JS API) → ${this.getString($r('app.string.main_log_register_failed'))} ${e.code} ${e.message}`);
      }
    }
  }

  unregisterCallback(id: number): void {
    const item = this.getStream(id);
    if (!item || !item.callbackRegistered) {
      return;
    }
    if (item.isCApi) {
      const ok = noiseReduction.unregisterCallback(id);
      this.log(`#${id} UnregisterNoiseReductionModeChangeCallback(C API, ${this.getString($r('app.string.main_log_specified'))}) → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.callbackRegistered = false; this.streamList = [...this.streamList];
        this.lastCallbackLogs.delete(id);
      }
    } else if (item.audioCapturer) {
      try {
        item.audioCapturer.offNoiseReductionModeChanged();
        item.callbackRegistered = false;
        this.streamList = [...this.streamList];
        this.log(`#${id} offNoiseReductionModeChanged(JS API) → success`);
      } catch (err) {
        const e = err as BusinessError;
        this.log(`#${id} offNoiseReductionModeChanged(JS API) → failed: ${e.code} ${e.message}`);
      }
    }
  }

  unregisterAllCallbacks(id: number): void {
    const item = this.getStream(id);
    if (!item || !item.callbackRegistered) {
      return;
    }
    if (item.isCApi) {
      const ok = noiseReduction.unregisterAllCallbacks(id);
      this.log(`#${id} UnregisterNoiseReductionModeChangeCallback(C API, ${this.getString($r('app.string.main_log_all'))}) → ${ok ? 'success' : 'failed'}`);
      if (ok) {
        item.callbackRegistered = false; this.streamList = [...this.streamList];
        this.lastCallbackLogs.delete(id);
      }
    } else { this.unregisterCallback(id); }
  }

  private getStream(id: number): StreamItem | null {
    for (let item of this.streamList) {
      if (item.id === id) {
        return item;
      }
    }
    return null;
  }

  private selectStream(id: number): void {
    this.selectedStreamId = id;
    this.queryCurrentMode(id);
  }

  @Builder
  DisplayScreen() {
    Column() {
      Text(getContext(this).resourceManager.getStringSync($r('app.string.main_current_stream_prefix').id) + this.selectedStreamLabel())
        .fontSize(11).fontColor('#5DCAA5').width('100%').padding(4)
      if (this.operationLogList.length === 0) {
        Text($r('app.string.main_no_operation_log')).fontSize(11).fontColor('#888780').padding(8)
      } else {
        Scroll(this.logScroller) {
          Column() {
            ForEach(this.operationLogList, (log: string) => {
              Text(log).fontSize(10).fontColor('#B5D4F4').width('100%').padding(2)
            })
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
        .scrollable(ScrollDirection.Vertical)
      }
    }
    .width('100%')
    .height(this.displayHeight > 0 ? this.displayHeight : '35%')
    .backgroundColor('#1a1a1a')
    .borderRadius(8)
    .padding(4)
  }

  @Builder
  StreamCard(item: StreamItem) {
    Column() {
      Row() {
        Text(`#${item.id}`).fontSize(10).fontWeight(FontWeight.Medium)
          .fontColor(item.id === this.selectedStreamId ? '#007DFF' : '#2C2C2A')
        Text(` ${item.sourceType}`).fontSize(9).fontColor(item.id === this.selectedStreamId ? '#007DFF' : '#2C2C2A')
        Blank()
        Text(`${item.apiType}`).fontSize(7).fontColor('#888780')
      }.width('100%')
      Text(`${item.samplingRate} | ${item.channels}ch`).fontSize(8).fontColor('#888780')
      Row() {
        Text(item.state === 'Running' ? '● Running' : `○ ${item.state}`).fontSize(8)
          .fontColor(item.state === 'Running' ? '#1D9E75' : '#888780')
        Blank()
        Text(getContext(this).resourceManager.getStringSync($r('app.string.main_noise_reduction_prefix').id) + item.currentMode).fontSize(7).fontColor('#888780')
      }.width('100%')
    }
    .width(120)
    .padding(6)
    .borderRadius(8)
    .backgroundColor(item.id === this.selectedStreamId ? '#E6F1FB' : '#F8F8F8')
    .border({
      width: item.id === this.selectedStreamId ? 1 : 0.5,
      color: item.id === this.selectedStreamId ? '#007DFF' : '#B4B2A9',
    })
    .onClick(() => this.selectStream(item.id))
  }

  @Builder
  TabTitleBar() {
    Row() {
      ForEach([$r('app.string.tab_stream_ops'), $r('app.string.tab_noise_mode'), $r('app.string.tab_callback'), $r('app.string.tab_stream_detail')], (title: ResourceStr, index: number) => {
        Row() {
          Circle({ width: 6, height: 6 })
            .fill(this.currentTabIndex === index ? '#007DFF' : '#D3D1C7')
          if (this.currentTabIndex === index) {
            Text(title).fontSize(12).fontWeight(FontWeight.Medium).fontColor('#007DFF').margin({ left: 2 })
          }
        }
        .margin({ left: 4, right: 4 })
      })
    }
    .width('100%')
    .height(32)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  Btn(text: ResourceStr, action: () => void, color: string = '#007DFF') {
    Button(text).height(32).fontSize(11).margin({ left: 3, right: 3 })
      .backgroundColor(color).fontColor('#FFF').onClick(() => action())
  }

  @Builder
  InfoRow(label: ResourceStr, value: ResourceStr) {
    Row() {
      Text(label).fontSize(11).fontColor('#888780').width('40%')
      Text(value).fontSize(11).fontColor('#2C2C2A').width('60%')
    }.width('100%').margin({ top: 2, bottom: 2 })
  }

  build() {
    Stack() {
    Column() {
      Row() {
        Text($r('app.string.main_demo_title')).fontSize(16).fontWeight(FontWeight.Bold).fontColor('#FFF')
        Blank()
        Text('≡').fontSize(18).fontColor('#FFF').onClick(() => router.pushUrl({ url: 'pages/MenuPage' }))
      }
      .width('100%').height(44).padding({ left: 12, right: 12 })
      .backgroundColor('#007DFF')

      if (this.isWideScreen) {
        Row() {
          Scroll() {
          Column() {
            this.DisplayScreen()
            Row() {
              Text($r('app.string.main_stream_list')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
              Text(`(${this.streamList.length})`).fontSize(10).fontColor('#888780')
              Blank()
              Text($r('app.string.main_new_stream')).fontSize(10).fontColor('#007DFF').onClick(() => { this.showParamDialog = true })
            }
            .width('100%').height(28).padding({ left: 8, right: 8 })

            Scroll() {
              Row() {
                ForEach(this.streamList, (item: StreamItem) => { this.StreamCard(item) })
                Column() {
                  Text($r('app.string.main_new_stream')).fontSize(11).fontColor('#007DFF')
                  Text($r('app.string.main_record_stream')).fontSize(9).fontColor('#888780')
                }
                .width(120)
                .height(56)
                .justifyContent(FlexAlign.Center)
                .borderRadius(8)
                .backgroundColor('#FFF')
                .border({ width: 1, color: '#B4B2A9' })
                .margin({ left: 4, right: 4 })
                .onClick(() => { this.showParamDialog = true })
              }
            }
            .scrollable(ScrollDirection.Horizontal)
            .width('100%')
            .height(70)
            .padding({ left: 4, right: 4 })
          }
          }
          .scrollBar(BarState.Off)
          .scrollable(ScrollDirection.Vertical)
          .width('38%')
          .height('100%')

          Column() {
            this.TabTitleBar()

            Swiper() {
              Column() {
                if (this.selectedStreamId > 0) {
                  Row() {
                    Text($r('app.string.main_config_params')).fontSize(10).fontColor('#007DFF')
                    Blank()
                    Text(`${this.sourceTypes[this.paramSourceType]}|${this.sampleRates[this.paramSamplingRate]}|` +
                      `${this.paramChannels + 1}ch ›`)
                      .fontSize(9).fontColor('#888780')
                  }
                  .width('90%').height(28)
                  .padding({ left: 8, right: 8 })
                  .margin({ top: 8 })
                  .backgroundColor('#F1F3F5')
                  .borderRadius(6)
                  .onClick(() => { this.showParamDialog = true })

                  Row() {
                    this.Btn($r('app.string.main_create'), () => this.createCapturer())
                    this.Btn('Start', () => this.startCapturer(this.selectedStreamId), '#4CAF50')
                    this.Btn('Stop', () => this.stopCapturer(this.selectedStreamId), '#FF9800')
                    this.Btn('Release', () => this.releaseCapturer(this.selectedStreamId), '#F44336')
                  }.margin({ top: 8 })
                  Row() {
                    this.Btn($r('app.string.main_query_supported'), () => this.querySupportedModes(this.selectedStreamId), '#607D8B')
                    this.Btn($r('app.string.main_query_current'), () => this.queryCurrentMode(this.selectedStreamId), '#607D8B')
                  }.margin({ top: 4 })

                  Text(this.selectedStreamStatus())
                    .fontSize(9).fontColor('#888780').width('90%')
                    .margin({ top: 10 })
                    .padding(6)
                    .backgroundColor('#F8F8F8')
                    .borderRadius(4)
                } else {
                  Text($r('app.string.main_select_stream_first')).fontSize(12).fontColor('#888780').margin({ top: 40 })
                }
              }
              .width('100%')

              Column() {
                if (this.selectedStreamId > 0) {
                  Text(getContext(this).resourceManager.getStringSync($r('app.string.main_set_mode_prefix').id) + `#${this.selectedStreamId}` + getContext(this).resourceManager.getStringSync($r('app.string.main_set_mode_suffix').id)).fontSize(10).fontColor('#888780').margin({ top: 8 })
                  Row() {
                    this.Btn('FIDELITY', () => this.setMode(this.selectedStreamId, 0))
                    this.Btn('PURE_VOCALS', () => this.setMode(this.selectedStreamId, 1))
                    this.Btn('STANDARD', () => this.setMode(this.selectedStreamId, 2))
                  }.margin({ top: 8 })
                } else {
                  Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
                }
              }
              .width('100%')

              Column() {
                if (this.selectedStreamId > 0) {
                  Text(getContext(this).resourceManager.getStringSync($r('app.string.main_callback_prefix').id) + `#${this.selectedStreamId}` + getContext(this).resourceManager.getStringSync($r('app.string.main_callback_suffix').id)).fontSize(10).fontColor('#888780').margin({ top: 8 })
                  Row() {
                    this.Btn($r('app.string.main_register_callback'), () => this.registerCallback(this.selectedStreamId))
                    this.Btn($r('app.string.main_unregister_specific'), () => this.unregisterCallback(this.selectedStreamId), '#888780')
                  }.margin({ top: 8 })
                  Row() {
                    this.Btn($r('app.string.main_unregister_all'), () => this.unregisterAllCallbacks(this.selectedStreamId), '#888780')
                  }.margin({ top: 4 })
                } else {
                  Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
                }
              }
              .width('100%')

              Column() {
                if (this.selectedStreamId > 0 && this.getSelectedStream() !== null) {
                  Text($r('app.string.main_basic_info')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
                    .width('90%').margin({ top: 10, bottom: 4 })
                  this.InfoRow('streamId', String(this.getSelectedStream()!.id))
                  this.InfoRow('SourceType', this.getSelectedStream()!.sourceType)
                  this.InfoRow($r('app.string.main_sampling_rate'), String(this.getSelectedStream()!.samplingRate))
                  this.InfoRow($r('app.string.main_channels'), `${this.getSelectedStream()!.channels}ch`)
                  this.InfoRow($r('app.string.main_state'), this.getSelectedStream()!.state)
                  this.InfoRow($r('app.string.main_api_type'), this.getSelectedStream()!.apiType)
                  Text($r('app.string.main_noise_reduction_info')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
                    .width('90%').margin({ top: 12, bottom: 4 })
                  this.InfoRow($r('app.string.main_current_mode'), this.getSelectedStream()!.currentMode)
                  this.InfoRow($r('app.string.main_supported_modes'), this.getSelectedStream()!.supportedModes)
                  this.InfoRow($r('app.string.main_callback_status'), this.getSelectedStream()!.callbackRegistered ? $r('app.string.main_registered') : $r('app.string.main_not_registered'))
                } else {
                  Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
                }
              }
              .width('100%')
            }
            .index(this.currentTabIndex)
            .onChange((index: number) => { this.currentTabIndex = index })
            .width('100%')
            .height(400)
          }
          .width('62%')
          .height('100%')
        }
        .width('100%')
        .layoutWeight(1)
      } else {
        Scroll() {
        Column() {
        this.DisplayScreen()

        Row() {
          Text($r('app.string.main_stream_list')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
          Text(`(${this.streamList.length})`).fontSize(10).fontColor('#888780')
          Blank()
          Text($r('app.string.main_new_stream')).fontSize(10).fontColor('#007DFF').onClick(() => { this.showParamDialog = true })
        }
        .width('100%').height(28).padding({ left: 12, right: 12 })

        Scroll() {
          Row() {
            ForEach(this.streamList, (item: StreamItem) => { this.StreamCard(item) })
            Column() {
              Text($r('app.string.main_new_stream')).fontSize(11).fontColor('#007DFF')
              Text($r('app.string.main_record_stream')).fontSize(9).fontColor('#888780')
            }
            .width(120)
            .height(56)
            .justifyContent(FlexAlign.Center)
            .borderRadius(8)
            .backgroundColor('#FFF')
            .border({ width: 1, color: '#B4B2A9' })
            .margin({ left: 4, right: 4 })
            .onClick(() => { this.showParamDialog = true })
          }
        }
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')
        .height(70)
        .padding({ left: 8, right: 8 })

        if (this.selectedStreamId > 0) {
          Text(getContext(this).resourceManager.getStringSync($r('app.string.main_selected_stream_prefix').id) + `${this.selectedStreamId}` + getContext(this).resourceManager.getStringSync($r('app.string.main_operation_applies_suffix').id))
            .fontSize(9).fontColor('#888780').width('100%').textAlign(TextAlign.Center).margin({ top: 2, bottom: 2 })
        }

        this.TabTitleBar()

        Swiper() {
          Column() {
            if (this.selectedStreamId > 0) {
              Row() {
                Text($r('app.string.main_config_params')).fontSize(10).fontColor('#007DFF')
                Blank()
                Text(`${this.sourceTypes[this.paramSourceType]}|${this.sampleRates[this.paramSamplingRate]}|` +
                  `${this.paramChannels + 1}ch ›`)
                  .fontSize(9).fontColor('#888780')
              }
              .width('90%').height(28)
              .padding({ left: 8, right: 8 })
              .margin({ top: 8 })
              .backgroundColor('#F1F3F5')
              .borderRadius(6)
              .onClick(() => { this.showParamDialog = true })

              Row() {
                this.Btn($r('app.string.main_create'), () => this.createCapturer())
                this.Btn('Start', () => this.startCapturer(this.selectedStreamId), '#4CAF50')
                this.Btn('Stop', () => this.stopCapturer(this.selectedStreamId), '#FF9800')
                this.Btn('Release', () => this.releaseCapturer(this.selectedStreamId), '#F44336')
              }.margin({ top: 8 })
              Row() {
                this.Btn($r('app.string.main_query_supported'), () => this.querySupportedModes(this.selectedStreamId), '#607D8B')
                this.Btn($r('app.string.main_query_current'), () => this.queryCurrentMode(this.selectedStreamId), '#607D8B')
              }.margin({ top: 4 })

              Text(this.selectedStreamStatus())
                .fontSize(9).fontColor('#888780').width('90%')
                .margin({ top: 10 })
                .padding(6)
                .backgroundColor('#F8F8F8')
                .borderRadius(4)
            } else {
              Text($r('app.string.main_select_stream_first')).fontSize(12).fontColor('#888780').margin({ top: 40 })
            }
          }
          .width('100%')

          Column() {
            if (this.selectedStreamId > 0) {
              Text(getContext(this).resourceManager.getStringSync($r('app.string.main_set_mode_prefix').id) + `#${this.selectedStreamId}` + getContext(this).resourceManager.getStringSync($r('app.string.main_set_mode_suffix').id)).fontSize(10).fontColor('#888780').margin({ top: 8 })
              Row() {
                this.Btn('FIDELITY', () => this.setMode(this.selectedStreamId, 0))
                this.Btn('PURE_VOCALS', () => this.setMode(this.selectedStreamId, 1))
                this.Btn('STANDARD', () => this.setMode(this.selectedStreamId, 2))
              }.margin({ top: 8 })
            } else {
              Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
            }
          }
          .width('100%')

          Column() {
            if (this.selectedStreamId > 0) {
              Text(getContext(this).resourceManager.getStringSync($r('app.string.main_callback_prefix').id) + `#${this.selectedStreamId}` + getContext(this).resourceManager.getStringSync($r('app.string.main_callback_suffix').id)).fontSize(10).fontColor('#888780').margin({ top: 8 })
              Row() {
                this.Btn($r('app.string.main_register_callback'), () => this.registerCallback(this.selectedStreamId))
                this.Btn($r('app.string.main_unregister_specific'), () => this.unregisterCallback(this.selectedStreamId), '#888780')
              }.margin({ top: 8 })
              Row() {
                this.Btn($r('app.string.main_unregister_all'), () => this.unregisterAllCallbacks(this.selectedStreamId), '#888780')
              }.margin({ top: 4 })
            } else {
              Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
            }
          }
          .width('100%')

          Column() {
            if (this.selectedStreamId > 0 && this.getSelectedStream() !== null) {
              Text($r('app.string.main_basic_info')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
                .width('90%').margin({ top: 10, bottom: 4 })
              this.InfoRow('streamId', String(this.getSelectedStream()!.id))
              this.InfoRow('SourceType', this.getSelectedStream()!.sourceType)
              this.InfoRow($r('app.string.main_sampling_rate'), String(this.getSelectedStream()!.samplingRate))
              this.InfoRow($r('app.string.main_channels'), `${this.getSelectedStream()!.channels}ch`)
              this.InfoRow($r('app.string.main_state'), this.getSelectedStream()!.state)
              this.InfoRow($r('app.string.main_api_type'), this.getSelectedStream()!.apiType)
              Text($r('app.string.main_noise_reduction_info')).fontSize(11).fontWeight(FontWeight.Medium).fontColor('#2C2C2A')
                .width('90%').margin({ top: 12, bottom: 4 })
              this.InfoRow($r('app.string.main_current_mode'), this.getSelectedStream()!.currentMode)
              this.InfoRow($r('app.string.main_supported_modes'), this.getSelectedStream()!.supportedModes)
              this.InfoRow($r('app.string.main_callback_status'), this.getSelectedStream()!.callbackRegistered ? $r('app.string.main_registered') : $r('app.string.main_not_registered'))
            } else {
              Text($r('app.string.main_select_stream_only')).fontSize(12).fontColor('#888780').margin({ top: 40 })
            }
          }
          .width('100%')
        }
        .index(this.currentTabIndex)
        .onChange((index: number) => { this.currentTabIndex = index })
        .width('100%')
        .height(400)
        }
        }
        .scrollBar(BarState.Auto)
        .scrollable(ScrollDirection.Vertical)
        .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')

    if (this.showParamDialog) {
      Column() {
        Column() {
          Text($r('app.string.main_param_config_title')).fontSize(14).fontWeight(FontWeight.Medium).margin({ top: 12, bottom: 8 })
          Text('SourceType').fontSize(11).fontColor('#666').width('90%').margin({ top: 4 })
          Row() {
            ForEach(this.sourceTypes, (s: string, i: number) => {
              Button(s).height(24).fontSize(9).margin({ left: 2, right: 2 })
                .backgroundColor(this.paramSourceType === i ? '#007DFF' : '#F1F3F5')
                .fontColor(this.paramSourceType === i ? '#FFF' : '#666')
                .onClick(() => this.paramSourceType = i)
            })
          }.margin({ top: 2 })
          Text($r('app.string.main_sampling_rate')).fontSize(11).fontColor('#666').width('90%').margin({ top: 8 })
          Row() {
            ForEach(this.sampleRateNames, (r: string, i: number) => {
              Button(r).height(24).fontSize(9).margin({ left: 2, right: 2 })
                .backgroundColor(this.paramSamplingRate === i ? '#007DFF' : '#F1F3F5')
                .fontColor(this.paramSamplingRate === i ? '#FFF' : '#666')
                .onClick(() => this.paramSamplingRate = i)
            })
          }.margin({ top: 2 })
          Text($r('app.string.main_channels')).fontSize(11).fontColor('#666').width('90%').margin({ top: 8 })
          Row() {
            ForEach(this.channelsList, (c: string, i: number) => {
              Button(c).height(24).fontSize(9).margin({ left: 2, right: 2 })
                .backgroundColor(this.paramChannels === i ? '#007DFF' : '#F1F3F5')
                .fontColor(this.paramChannels === i ? '#FFF' : '#666')
                .onClick(() => this.paramChannels = i)
            })
          }.margin({ top: 2 })
          Row() {
            Button($r('app.string.main_cancel')).height(32).fontSize(12).margin({ right: 8 })
              .backgroundColor('#888780').fontColor('#FFF').onClick(() => this.showParamDialog = false)
            Button($r('app.string.main_confirm')).height(32).fontSize(12).margin({ left: 8 })
              .backgroundColor('#007DFF').fontColor('#FFF')
              .onClick(() => { this.showParamDialog = false; this.createCapturer() })
          }.margin({ top: 12, bottom: 12 })
        }
        .width('80%')
        .backgroundColor('#FFF')
        .borderRadius(12)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('rgba(0,0,0,0.5)')
      .justifyContent(FlexAlign.Center)
    }
    }
  }
}
