import { getLearningController } from '../learning/LearningContext';
import { LearningSnapshot, emptyLearningSnapshot } from '../learning/LearningTypes';
import { LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED } from './LearningUi';

/** Actual coordinator facts; no scene payload or personal fields are exported here. */
@Component
export struct SceneContinuationStatus {
  @State private state: LearningSnapshot = emptyLearningSnapshot();
  @State private detailsExpanded: boolean = false;
  private unsubscribe: (() => void) | undefined = undefined;
  aboutToAppear(): void {
    this.unsubscribe?.();
    this.unsubscribe = getLearningController()?.subscribe((snapshot: LearningSnapshot): void => { this.state = snapshot; });
  }
  aboutToDisappear(): void { this.unsubscribe?.(); this.unsubscribe = undefined; }
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Text(this.state.sessionState).fontSize(13).lineHeight(20).fontColor(LEARNING_INK).layoutWeight(1)
        if (!this.state.sessionActive && !this.state.conflictPending) {
          Button(this.detailsExpanded ? '收起' : '接续详情', { type: ButtonType.Normal })
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .onClick((): void => { this.detailsExpanded = !this.detailsExpanded; })
        }
      }.width('100%')
      if (this.detailsExpanded || this.state.sessionActive || this.state.conflictPending) {
        Text(`系统结果：${this.state.quickResult}`).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
        Text(`窗口：${this.state.windowState}`).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
        Text(`业务定位：${this.state.businessPositionState}`).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
      }
      if (this.state.conflictPending) {
        Text(this.state.conflictSummary).fontSize(14).fontColor(LEARNING_INK).width('100%')
        Button(this.state.conflictAccepted ? '已接受，仍等待全部门控' : '接受接续版本')
          .width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .enabled(!this.state.conflictAccepted).onClick((): void => { getLearningController()?.acceptConflict(); })
        Button('保留本机并取消本轮', { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { getLearningController()?.rejectConflict(); })
      }
      if (this.state.sessionActive) {
        Button('重试业务定位').width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .onClick((): void => { getLearningController()?.retryBusinessPosition(); })
        Button('取消本轮并保留本机', { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { getLearningController()?.stopLocalWait(); })
      }
    }.width('100%').padding(12).backgroundColor('#FFFFFF').borderRadius(14)
  }
}
