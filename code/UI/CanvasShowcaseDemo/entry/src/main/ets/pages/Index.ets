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
 
import { CanvasScenes } from '../model/CanvasScenes';
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';
import { SceneRegistry, SceneInfo } from '../model/utils/SceneRegistry';
import { PerfTimer } from '../model/utils/PerfTimer';

const MAX_LOG_COUNT = 120;
/** 渐变动画帧间隔 ms */
const ANIM_INTERVAL_MS = 100;

@Entry
@Component
struct Index {
  @State logs: string[] = [];
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  @State sceneTitle: string = '';
  @State animRunning: boolean = false;
  /** 当前已绘制场景 id，-1 表示无选中（动画/清空后复位） */
  @State activeSceneId: number = -1;
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));
  private scenes: SceneInfo[] = SceneRegistry.getAll();
  private animTimerId: number = -1;
  private animT: number = 0;
  private drawTimer: PerfTimer = new PerfTimer();

  /** 读取字符串资源；用于与动态内容拼接的场景 */
  private getString(resource: Resource): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id);
    } catch (err) {
      return '';
    }
  }

  private sceneCurrentSuffix(): string {
    return this.getString($r('app.string.scene_current_suffix'));
  }

  aboutToAppear(): void {
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.sceneTitle = this.getString($r('app.string.scene_title_idle'));
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
    LogUtil.info('Index', `场景注册表加载完成：${SceneRegistry.count()} 个场景`);
  }

  aboutToDisappear(): void {
    this.stopAnim();
  }

  private pushLog(line: string): void {
    this.logs = [line, ...this.logs].slice(0, MAX_LOG_COUNT);
  }

  /** 执行场景前清屏并复位变换 */
  private clearCanvas(): void {
    this.context.setTransform(new Matrix2D().identity());
    this.context.clearRect(0, 0, this.context.width, this.context.height);
  }

  private runScene(id: number): void {
    this.stopAnim();
    const scene: SceneInfo | null = SceneRegistry.getById(id);
    if (scene === null) {
      LogUtil.error('Index', `场景 ${id} 未注册`);
      return;
    }
    this.clearCanvas();
    this.sceneTitle = scene.title;
    this.activeSceneId = id;
    const w: number = this.context.width;
    const h: number = this.context.height;
    // 绘制计时：日志输出各场景耗时，便于性能对比
    const cost: number = PerfTimer.time('Index', scene.title, (): number => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      scene.draw(this.context, w, h);
      return t.stop();
    });
    LogUtil.info('Index', `场景 ${id} 绘制完成，耗时 ${cost}ms`);
    this.drawTimer.start();
    this.drawTimer.stop();
  }

  /** 渐变动画：定时器驱动 drawGradientFrame，t 在 [0,1) 循环 */
  private startAnim(): void {
    if (this.animRunning) {
      return;
    }
    this.clearCanvas();
    this.sceneTitle = this.getString($r('app.string.scene_title_anim'));
    this.activeSceneId = -1;
    this.animRunning = true;
    this.animT = 0;
    LogUtil.info('Index', `渐变动画启动：间隔 ${ANIM_INTERVAL_MS}ms`);
    this.animTimerId = setInterval(() => {
      this.animT = (this.animT + 0.05) % 1;
      CanvasScenes.drawGradientFrame(this.context, this.context.width, this.context.height, this.animT);
    }, ANIM_INTERVAL_MS);
  }

  private stopAnim(): void {
    if (this.animTimerId !== -1) {
      clearInterval(this.animTimerId);
      this.animTimerId = -1;
      LogUtil.info('Index', '渐变动画停止');
    }
    this.animRunning = false;
  }

  /** 清空为不可恢复操作，先弹框二次确认 */
  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: $r('app.string.clear_dialog_title'),
      message: $r('app.string.clear_dialog_message'),
      autoCancel: true,
      primaryButton: {
        value: $r('app.string.common_cancel'),
        action: () => {
          LogUtil.info('Index', '已取消清空');
        }
      },
      secondaryButton: {
        value: $r('app.string.common_clear'),
        fontColor: '#E53935',
        action: () => {
          this.stopAnim();
          this.clearCanvas();
          this.logs = [];
          this.sceneTitle = this.getString($r('app.string.scene_title_cleared'));
          this.activeSceneId = -1;
          LogUtil.info('Index', '画布与日志已清空');
        }
      }
    });
  }

  @Builder
  buttonsArea() {
    Column({ space: 6 }) {
      ForEach(this.scenes, (s: SceneInfo) => {
        Button(this.activeSceneId === s.id ? s.button + this.sceneCurrentSuffix() : s.button)
          .width('100%').height(36)
          .backgroundColor(this.activeSceneId === s.id ? '#1565C0' : '#E3F2FD')
          .fontColor(this.activeSceneId === s.id ? Color.White : '#1565C0')
          .onClick(() => this.runScene(s.id))
      }, (s: SceneInfo) => `${s.id}`)
      Button(this.animRunning ? $r('app.string.btn_anim_stop') : $r('app.string.btn_anim_start'))
        .width('100%').height(36)
        .backgroundColor(this.animRunning ? '#E53935' : '#43A047')
        .onClick(() => {
          if (this.animRunning) {
            this.stopAnim();
          } else {
            this.startAnim();
          }
        })
      Button($r('app.string.btn_clear'))
        .width('100%').height(36)
        .backgroundColor('#78909C')
        .onClick(() => {
          this.confirmClear();
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
        Blank()
        Text($r('app.string.breakpoint_prefix', this.bp))
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
    Column({ space: 10 }) {
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

      // 画布演示区
      Column({ space: 4 }) {
        Text(this.sceneTitle)
          .fontSize(13)
          .fontColor('#333333')
          .width('100%')
        Canvas(this.context)
          .width('100%')
          .layoutWeight(1)
          .backgroundColor('#FAFAFA')
          .borderRadius(8)
          .onReady(() => {
            LogUtil.info('Index', `Canvas 就绪：${this.context.width}x${this.context.height}`);
            this.runScene(1);
          })
      }
      .width('100%')
      .height(280)

      if (this.bp === 'sm') {
        // 窄屏：上下单栏
        Scroll() {
          this.buttonsArea()
        }
        .width('100%')
        .height(180)
        .scrollBar(BarState.Auto)
        this.logArea()
      } else {
        // 宽屏：左按钮右日志双栏
        Row({ space: 12 }) {
          Column() {
            Scroll() {
              this.buttonsArea()
            }
            .width('100%')
            .scrollBar(BarState.Auto)
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
