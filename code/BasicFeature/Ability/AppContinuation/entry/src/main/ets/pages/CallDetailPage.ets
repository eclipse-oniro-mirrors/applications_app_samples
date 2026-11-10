/** Immutable operation evidence, not a second controller and never an automatic retry. */
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningController } from '../learning/LearningController';
import { OperationRecord, LearningSnapshot } from '../learning/LearningTypes';
import {
  copyLearningText, learningError, learningLevel, openLearningTab, LEARNING_BG, LearningAction, LearningCard,
  LearningEnvironment, LearningEvents, LearningFacts, LearningHeader, LearningLine, LearningNotice,
  rawLearningRecord
} from '../components/LearningUi';

interface DetailParams {
  id?: string;
}

@Entry
@Component
struct CallDetailPage {
  @State operationId: string = '';
  @State record: OperationRecord | undefined = undefined;
  @State notice: string = '';
  @State message: string = '';
  @State environmentExpanded: boolean = false;
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
    const params = this.getUIContext().getRouter().getParams() as DetailParams | undefined;
    this.operationId = params !== undefined && typeof params.id === 'string' ? params.id : '';
    const controller = getLearningController();
    this.controller = controller;
    if (controller === undefined) {
      this.record = undefined;
      this.notice = '运行对象正在初始化，操作详情加载中。';
      return;
    }
    this.refresh();
    this.unsubscribe = controller.subscribe((_snapshot: LearningSnapshot) => {
      this.record = controller.record(this.operationId);
    });
  }

  private refresh(): void {
    const controller = this.controller;
    if (controller !== undefined) {
      this.record = controller.record(this.operationId);
      this.notice = '';
    }
  }

  private feedback(message: string): void {
    this.message = message;
  }

  private copyRaw(): void {
    const record = this.record;
    if (record === undefined) {
      this.message = '当前未找到这条记录，请前往诊断中心查看现有记录。';
      return;
    }
    copyLearningText(rawLearningRecord(record), (message: string) => this.feedback(message));
  }

  private copySummary(): void {
    const controller = this.controller;
    if (controller === undefined || this.record === undefined) {
      this.message = '当前暂无可复制的操作摘要。';
      return;
    }
    copyLearningText(controller.diagnosticSummary(this.operationId), (message: string) => this.feedback(message));
  }

  private openTab(tab: number): void {
    openLearningTab(this.getUIContext(), tab, (message: string) => this.feedback(message));
  }

  private back(): void {
    try {
      if (Number(this.getUIContext().getRouter().getLength()) > 1) {
        this.getUIContext().getRouter().back();
      } else {
        this.openTab(2);
      }
    } catch (error) {
      this.message = `返回失败：${learningError(error as BusinessError)}`;
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        LearningHeader({ title: '调用详情' })
        LearningNotice({ title: '提示', message: this.message.length > 0 ? this.message : this.notice })
        if (this.record === undefined) {
          LearningCard({ title: '未找到记录' }) {
            LearningAction({ label: '返回诊断中心', onTap: () => this.openTab(2) })
          }
        } else {
          LearningCard({ title: this.record.title }) {
            LearningLine({ label: '结果', value: this.record.result })
            LearningLine({ label: '阶段 / 级别', value: `${this.record.stage} · ${learningLevel(this.record.level)}` })
            LearningLine({ label: '开始 / 结束', value: `${this.record.startedAt}\n${this.record.endedAt.length > 0 ? this.record.endedAt : '进行中'}` })
            LearningLine({ label: '耗时', value: `${this.record.durationMillis} ms` })
          }
          LearningCard({ title: '返回结果' }) {
            LearningLine({ label: '错误码', value: this.record.errorCode })
            if (this.record.rawMessage.length > 0) {
              LearningLine({ label: '错误信息', value: this.record.rawMessage })
            }
            if (this.record.rawResultState.length > 0) {
              LearningLine({ label: '结果状态', value: this.record.rawResultState })
            }
            if (this.record.resultInfo.length > 0) {
              LearningLine({ label: '结果信息', value: this.record.resultInfo })
            }
            LearningAction({ label: '复制返回结果', secondary: true, onTap: () => this.copyRaw() })
          }
          if (this.record.facts.length > 0 || this.record.explanation.length > 0 || this.record.nextSteps.length > 0) {
            LearningCard({ title: '诊断信息' }) {
              if (this.record.facts.length > 0) {
                LearningFacts({ title: '操作记录', lines: this.record.facts })
              }
              if (this.record.explanation.length > 0) {
                LearningFacts({ title: '结果说明', lines: this.record.explanation })
              }
              if (this.record.nextSteps.length > 0) {
                LearningFacts({ title: '建议', lines: this.record.nextSteps })
              }
              LearningAction({ label: '复制诊断摘要', secondary: true, onTap: () => this.copySummary() })
            }
          }
          LearningCard({ title: '更多信息' }) {
            LearningAction({ label: this.environmentExpanded ? '收起环境信息' : '查看环境信息', secondary: true,
              onTap: () => { this.environmentExpanded = !this.environmentExpanded; } })
            if (this.environmentExpanded) {
              LearningEnvironment({ items: this.record.environment })
            }
            LearningAction({ label: this.eventsExpanded ? '收起事件记录' : `查看事件记录（${this.record.events.length}）`,
              secondary: true, onTap: () => { this.eventsExpanded = !this.eventsExpanded; } })
            if (this.eventsExpanded) {
              LearningEvents({ events: this.record.events })
            }
          }
        }
        LearningAction({ label: '返回调用', onTap: () => this.openTab(1) })
        LearningAction({ label: '返回', secondary: true, onTap: () => this.back() })
      }
      .width('100%').padding({ left: 20, right: 20, top: 8, bottom: 28 });
    }
    .width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart).backgroundColor(LEARNING_BG);
  }
}
