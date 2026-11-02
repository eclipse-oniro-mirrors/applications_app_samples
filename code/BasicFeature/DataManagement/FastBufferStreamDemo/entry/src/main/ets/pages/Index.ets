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

@Entry
@Component
struct Index {
  @State logs: string[] = [];
  @State busy: boolean = false;
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  /** 最近点击的场景 id，-1 表示尚未执行 */
  @State activeScene: number = -1;
  private basics: FastBufferBasics = new FastBufferBasics();
  private pipeline: StreamPipeline = new StreamPipeline();

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

  private pushLog(line: string): void {
    this.logs = [line, ...this.logs].slice(0, MAX_LOG_COUNT);
  }

  private filesDir(): string {
    return getContext(this).filesDir;
  }

  @Builder
  buttonsArea() {
    Column({ space: 8 }) {
      Button('场景1：FastBuffer 基础操作（创建/读写/编码/拼接/切片）')
        .width('100%')
        .backgroundColor(this.activeScene === 1 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 1 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 1;
          this.basics.runBasics();
        })
      Button('场景2：FastBuffer vs Buffer 性能对比')
        .width('100%')
        .backgroundColor(this.activeScene === 2 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 2 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 2;
          this.basics.runBenchmark();
        })
      Button('场景3：Writable 流式写入（水位线背压）')
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 3 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 3 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 3;
          this.busy = true;
          this.pipeline.runWritableDemo(this.filesDir());
        })
      Button('场景4：Readable 流式读取（分块消费）')
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 4 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 4 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 4;
          this.busy = true;
          this.pipeline.runReadableDemo(this.filesDir());
        })
      Button('场景5：三流流水线 Readable→Transform→Writable')
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 5 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 5 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 5;
          this.busy = true;
          this.pipeline.runPipelineDemo(this.filesDir());
        })
      Button('场景6：工具类实战（协议封包/CRC 校验/hexDump）')
        .width('100%')
        .backgroundColor(this.activeScene === 6 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 6 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 6;
          this.basics.runPacketDemo();
        })
      Button('场景7：TLV 协议流解析（噪声定位/CRC 检出/截断防护）')
        .width('100%')
        .backgroundColor(this.activeScene === 7 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 7 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 7;
          this.basics.runTlvDemo();
        })
      Button('场景8：pipe 一行流水线（Readable→Transform→Writable）')
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 8 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 8 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 8;
          this.busy = true;
          this.pipeline.runPipeDemo(this.filesDir());
        })
      Button('场景9：Duplex 双工流（写侧回显/读侧回送）')
        .width('100%')
        .enabled(!this.busy)
        .backgroundColor(this.activeScene === 9 ? '#1565C0' : '#E3F2FD')
        .fontColor(this.activeScene === 9 ? Color.White : '#1565C0')
        .onClick(() => {
          this.activeScene = 9;
          this.busy = true;
          this.pipeline.runDuplexDemo();
        })
    }
    .width('100%')
  }

  @Builder
  logArea() {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text('事件日志')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        if (this.busy) {
          Text('（流式执行中…）')
            .fontSize(12)
            .fontColor('#FF8800')
        }
        Blank()
        Text(`断点：${this.bp}`)
          .fontSize(11)
          .fontColor('#999999')
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.logs, (line: string, index: number) => {
          ListItem() {
            Text(line)
              .fontSize(12)
              .width('100%')
          }
        }, (line: string, index: number) => `${index}-${line}`)
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
      Text('FastBuffer 与 Stream 流式数据处理')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text('FastBuffer（API 20+）高效二进制缓冲 · Stream（API 12+）分块流式读写 · 展示高效缓冲和流式数据')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')

      // 设备信息卡（DAYU200 上用于确认运行环境与断点档位）
      Row({ space: 10 }) {
        Text(`设备：${this.deviceType}`)
          .fontSize(12)
        Text(`API：${this.apiVersion}`)
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
