/** Live continuation signals. Navigation never disposes the Ability-scoped controller. */
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningController } from '../learning/LearningController';
import { DiagnosticEvent, emptyLearningSnapshot, LearningSnapshot } from '../learning/LearningTypes';
import {
  confirmLearningAction, learningError, openLearningTab, LEARNING_BG, LearningAction, LearningCard,
  LearningEvents, LearningHeader, LearningLine, LearningNotice
} from '../components/LearningUi';

@Entry
@Component
struct ProcessPage {
  @State snapshot: LearningSnapshot = emptyLearningSnapshot();
  @State message: string = '';
  @State eventsExpanded: boolean = false;
  private controller: LearningController | undefined = undefined;
  private unsubscribe: (() => void) | undefined = undefined;

  aboutToAppear(): void {
    this.bindController();
  }

  onPageShow(): void {
    this.bindController();
  }

  onPageHide(): void {
    this.detach();
  }

  aboutToDisappear(): void {
    this.detach();
    this.controller = undefined;
  }

  private detach(): void {
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) {
      unsubscribe();
      this.unsubscribe = undefined;
    }
  }

  private bindController(): void {
    this.detach();
    const controller = getLearningController();
    this.controller = controller;
    if (controller === undefined) {
      this.snapshot = emptyLearningSnapshot();
      return;
    }
    this.snapshot = controller.snapshot();
    this.unsubscribe = controller.subscribe((next: LearningSnapshot) => {
      this.snapshot = next;
    });
  }

  private feedback(message: string): void {
    this.message = message;
  }

  private confirmStop(): void {
    confirmLearningAction(this.getUIContext(), '停止本地等待？',
      '结束当前等待并清理监听？',
      () => {
        const controller = this.controller;
        if (controller === undefined) {
          this.message = '运行对象正在初始化，请稍后重试。';
          return;
        }
        try {
          controller.stopLocalWait();
          this.snapshot = controller.snapshot();
          this.message = '已停止本地等待，监听清理结果见诊断。';
        } catch (error) {
          this.message = `停止请求未完成：${learningError(error as BusinessError)}`;
        }
      }, (message: string) => this.feedback(message));
  }

  private openTab(tab: number): void {
    openLearningTab(this.getUIContext(), tab, (message: string) => this.feedback(message));
  }

  private sessionEvents(): DiagnosticEvent[] {
    if (this.snapshot.sessionRecordId.length === 0) {
      return [];
    }
    return this.snapshot.events.filter((event: DiagnosticEvent) => event.operationId === this.snapshot.sessionRecordId);
  }

  private openSessionDiagnostic(): void {
    if (this.snapshot.sessionRecordId.length === 0) {
      this.openTab(2);
      return;
    }
    try {
      this.getUIContext().getRouter().pushUrl({
        url: 'pages/CallDetailPage',
        params: { id: this.snapshot.sessionRecordId }
      },
        (error: BusinessError) => {
          if (error) {
            this.message = `未打开本轮诊断：${learningError(error)}`;
          }
        });
    } catch (error) {
      this.message = `本轮诊断导航不可用：${learningError(error as BusinessError)}`;
    }
  }

  private back(): void {
    try {
      if (Number(this.getUIContext().getRouter().getLength()) > 1) {
        this.getUIContext().getRouter().back();
      } else {
        this.openTab(1);
      }
    } catch (error) {
      this.message = `返回失败：${learningError(error as BusinessError)}`;
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        LearningHeader({ title: '接续过程' })
        LearningNotice({ title: '提示', message: this.message.length > 0 ? this.message : this.snapshot.notice })
        LearningCard({ title: '当前状态' }) {
          LearningLine({ label: '接续', value: this.snapshot.sessionState })
          LearningLine({ label: '启动', value: this.snapshot.launchReason })
          LearningLine({ label: '监听', value: this.snapshot.listenerState })
        }
        LearningCard({ title: '恢复进度' }) {
          LearningLine({ label: '快速拉起', value: this.snapshot.quickResult })
          LearningLine({ label: '业务数据', value: this.snapshot.dataState })
          LearningLine({ label: '窗口', value: this.snapshot.windowState })
          LearningLine({ label: '实际业务定位', value: this.snapshot.businessPositionState })
          LearningLine({ label: '状态恢复', value: this.snapshot.committed ? '已完成' : '尚未提交' })
          if (this.snapshot.sessionActive && this.controller?.positionTarget() !== undefined) {
            LearningAction({ label: '重试实际业务页定位', onTap: () => this.controller?.retryBusinessPosition() })
          }
          if (this.snapshot.conflictPending) {
            Text(this.snapshot.conflictSummary).fontSize(14).width('100%')
            LearningAction({ label: this.snapshot.conflictAccepted ? '已接受，等待所有门控' : '接受接续版本',
              actionEnabled: !this.snapshot.conflictAccepted, onTap: () => this.controller?.acceptConflict() })
            LearningAction({ label: '保留本机并取消', secondary: true, onTap: () => this.controller?.rejectConflict() })
          }
          if (this.snapshot.restoredSummary.length > 0) {
            LearningLine({ label: '恢复摘要', value: this.snapshot.restoredSummary })
          }
        }
        LearningCard({ title: '事件记录' }) {
          LearningAction({ label: this.eventsExpanded ? '收起事件' : `查看事件（${this.sessionEvents().length}）`,
            secondary: true, onTap: () => { this.eventsExpanded = !this.eventsExpanded; } })
          if (this.eventsExpanded) {
            LearningEvents({ events: this.sessionEvents() })
          }
        }
        LearningAction({ label: '停止等待', actionEnabled: this.snapshot.canStop, secondary: true,
          onTap: () => this.confirmStop() })
        LearningAction({ label: '查看诊断', onTap: () => this.openSessionDiagnostic() })
        LearningAction({ label: '返回调用', secondary: true, onTap: () => this.openTab(1) })
        LearningAction({ label: '返回', secondary: true, onTap: () => this.back() })
      }
      .width('100%').padding({ left: 20, right: 20, top: 8, bottom: 28 });
    }
    .width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart).backgroundColor(LEARNING_BG);
  }
}
