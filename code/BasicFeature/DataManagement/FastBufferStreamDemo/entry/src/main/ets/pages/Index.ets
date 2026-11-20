/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { FastBufferBasics } from '../model/FastBufferBasics';
import { StreamPipeline } from '../model/StreamPipeline';
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';

const MAX_LOG_COUNT = 120;
const LOG_FLUSH_INTERVAL_MS = 50;

interface LogEntry {
  id: number;
  text: string;
}

@Entry
@Component
struct Index {
  @State logs: LogEntry[] = [];
  @State busy: boolean = false;
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  /** 最近点击的场景 id，-1 表示尚未执行 */
  @State activeScene: number = -1;
  private basics: FastBufferBasics = new FastBufferBasics();
  private pipeline: StreamPipeline = new StreamPipeline();
  private nextLogId: number = 0;
  private pendingLogs: LogEntry[] = [];
  private flushTimer: number = -1;

  aboutToAppear(): void {
    // 统一日志：工具类与业务层都走 LogUtil，UI 面板只做展示
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    // 流式场景完成/出错后由 StreamPipeline 回调解锁按钮（否则 busy 永久为 true）
    this.pipeline.onDone = (): void => {
      this.busy = false;
    };
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
  }

  aboutToDisappear(): void {
    if (this.flushTimer !== -1) {
      clearTimeout(this.flushTimer);
      this.flushTimer = -1;
    }
    this.flushLogs();
  }

  /** 日志先入队，每 50ms 合并刷新一次，避免每条日志都触发整列表重建 */
  private pushLog(line: string): void {
    this.pendingLogs.push({ id: this.nextLogId++, text: line });
    if (this.flushTimer === -1) {
      this.flushTimer = setTimeout(() => {
        this.flushTimer = -1;
        this.flushLogs();
      }, LOG_FLUSH_INTERVAL_MS);
    }
  }

  private flushLogs(): void {
    if (this.pendingLogs.length === 0) {
      return;
    }
    const batch: LogEntry[] = this.pendingLogs;
    this.pendingLogs = [];
    batch.reverse();
    this.logs = batch.concat(this.logs).slice(0, MAX_LOG_COUNT);
  }

  /** 下一帧再执行场景，保证按钮高亮/执行中状态先完成渲染 */
  private defer(task: () => void): void {
    setTimeout(task, 0);
  }

  private filesDir(): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      LogUtil.error('Index', '无法获取 HostContext，filesDir 回退为空');
      return '';
    }
    return context.filesDir;
  }

  @Builder
  buttonsArea() {
    Column({ space: 8 }) {
      Button($r('app.string.btn_scene_1'))
        .width('100%')
        .backgroundColor(this.activeScene === 1 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 1 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 1;
          this.defer(() => {
            this.basics.runBasics();
          });
        })
      Button($r('app.string.btn_scene_2'))
        .width('100%')
        .backgroundColor(this.activeScene === 2 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 2 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 2;
          this.defer(() => {
            this.basics.runBenchmark();
          });
        })
      Button($r('app.string.btn_scene_3'))
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 3 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 3 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 3;
          this.busy = true;
          this.defer(() => {
            this.pipeline.runWritableDemo(this.filesDir());
          });
        })
      Button($r('app.string.btn_scene_4'))
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 4 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 4 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 4;
          this.busy = true;
          this.defer(() => {
            this.pipeline.runReadableDemo(this.filesDir());
          });
        })
      Button($r('app.string.btn_scene_5'))
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 5 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 5 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 5;
          this.busy = true;
          this.defer(() => {
            this.pipeline.runPipelineDemo(this.filesDir());
          });
        })
      Button($r('app.string.btn_scene_6'))
        .width('100%')
        .backgroundColor(this.activeScene === 6 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 6 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 6;
          this.defer(() => {
            this.basics.runPacketDemo();
          });
        })
      Button($r('app.string.btn_scene_7'))
        .width('100%')
        .backgroundColor(this.activeScene === 7 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 7 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 7;
          this.defer(() => {
            this.basics.runTlvDemo();
          });
        })
      Button($r('app.string.btn_scene_8'))
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 8 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 8 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 8;
          this.busy = true;
          this.defer(() => {
            this.pipeline.runPipeDemo(this.filesDir());
          });
        })
      Button($r('app.string.btn_scene_9'))
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 9 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 9 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 9;
          this.busy = true;
          this.defer(() => {
            this.pipeline.runDuplexDemo();
          });
        })
    }
    .width('100%')
  }

  @Builder
  logArea() {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text($r('app.string.log_title'))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        if (this.busy) {
          Text($r('app.string.log_running'))
            .fontSize(12)
            .fontColor('#FF8800')
        }
        Blank()
        Text($r('app.string.breakpoint_prefix', this.bp))
          .fontSize(11)
          .fontColor('#999999')
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.logs, (item: LogEntry, index: number) => {
          ListItem() {
            Text(item.text)
              .fontSize(12)
              .width('100%')
          }
        }, (item: LogEntry, index: number) => item.id.toString())
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .layoutWeight(1)
    .width('100%')
  }

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.page_title'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text($r('app.string.page_subtitle'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')

      // 设备信息卡（DAYU200 上用于确认运行环境与断点档位）
      Row({ space: 10 }) {
        Text($r('app.string.device_prefix', this.deviceType))
          .fontSize(12)
        Text($r('app.string.api_prefix', this.apiVersion))
          .fontSize(12)
        Text(this.osName)
          .fontSize(12)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F0FE')
      .borderRadius(8)

      if (this.bp === 'sm') {
        // 窄屏：上下单栏
        this.buttonsArea()
        this.logArea()
      } else {
        // 宽屏：左按钮右日志双栏
        Row({ space: 12 }) {
          Column() {
            this.buttonsArea()
          }
          .width('38%')

          Column() {
            this.logArea()
          }
          .width('62%')
        }
        .layoutWeight(1)
        .alignItems(VerticalAlign.Top)
      }
    }
    .padding(16)
    .width('100%')
    .height('100%')
    .onAreaChange((_oldArea: Area, newArea: Area) => {
      const widthVp: number = Number(newArea.width);
      const next: Breakpoint = DeviceUtil.getBreakpoint(widthVp);
      if (next !== this.bp) {
        this.bp = next;
        LogUtil.info('Index', `窗口宽度 ${widthVp.toFixed(0)}vp，断点切换为 ${next}`);
      }
    })
  }
}
