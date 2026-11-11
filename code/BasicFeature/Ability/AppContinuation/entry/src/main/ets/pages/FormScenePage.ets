import { getLearningController } from '../learning/LearningContext';
import { SceneSnapshot } from '../learning/scene/SceneWorkbench';
import { ScenePageSession } from '../learning/scene/ScenePageSession';
import { FORM_STEPS } from '../learning/scene/SceneModel';
import { SceneContinuationStatus } from '../components/SceneContinuationStatus';
import { LEARNING_BG, LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED, openLearningTab } from '../components/LearningUi';

@Entry
@Component
struct FormScenePage {
  @State private view: SceneSnapshot = new SceneSnapshot();
  @State private navigationMessage: string = '';
  private readonly binding: ScenePageSession = new ScenePageSession('form');
  private receiptRequest: number = -1;
  aboutToAppear(): void { this.bind(); }
  onPageShow(): void { this.bind(); }
  onPageHide(): void { this.binding.hide(); }
  aboutToDisappear(): void { this.binding.hide(); }
  private bind(): void {
    this.binding.bind(getLearningController(), (): void => { this.view = this.binding.snapshot(); });
  }
  private positionRendered(): void {
    const target = this.binding.target();
    if (target === undefined || target.document.state.kind !== 'form' || target.request === this.receiptRequest ||
      this.view.formStep !== target.document.state.form.step) { return; }
    this.receiptRequest = target.request;
    this.binding.receipt(target, this.view.formStep, 0, true);
  }
  private edit(field: string, value: string): void {
    if (this.view.editable) { getLearningController()?.sceneWorkbench.setFormField(field, value); }
  }
  private backToWorkbench(): void {
    this.navigationMessage = '';
    openLearningTab(this.getUIContext(), 1, (message: string): void => { this.navigationMessage = message; });
  }
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button('返回工作台', { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { this.backToWorkbench(); })
        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage).fontSize(14).fontColor('#B42318').width('100%')
        }
        Text('表单草稿').fontSize(26).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%')
        Text(this.view.text()).fontSize(14).fontColor(LEARNING_MUTED).width('100%')
        SceneContinuationStatus()
        Row({ space: 8 }) {
          ForEach(FORM_STEPS, (label: string, index: number) => {
            Button(`${index + 1}. ${label}`, { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(13)
              .fontColor(this.view.formStep === index ? '#FFFFFF' : LEARNING_BLUE)
              .backgroundColor(this.view.formStep === index ? LEARNING_BLUE : '#EEF4FF').borderRadius(10)
              .enabled(this.view.editable)
              .onClick((): void => { getLearningController()?.sceneWorkbench.gotoFormStep(index); })
          }, (label: string) => label)
        }.width('100%')
        Column({ space: 12 }) {
          Text(`步骤 ${this.view.formStep + 1}：${this.view.formStepLabel}`).fontSize(16).fontWeight(FontWeight.Medium)
            .fontColor(LEARNING_INK).width('100%')
          if (this.view.formStep === 0) {
            TextInput({ text: this.view.formName, placeholder: '姓名' }).maxLength(40)
              .height(48).fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).enabled(this.view.editable)
              .onChange((value: string): void => this.edit('name', value))
            TextInput({ text: this.view.formPhone, placeholder: '手机号' }).maxLength(20)
              .height(48).fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).enabled(this.view.editable)
              .onChange((value: string): void => this.edit('phone', value))
          } else if (this.view.formStep === 1) {
            TextArea({ text: this.view.formAddress, placeholder: '地址' }).height(120).maxLength(100)
              .fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).enabled(this.view.editable)
              .onChange((value: string): void => this.edit('address', value))
          } else {
            TextArea({ text: this.view.formNote, placeholder: '备注（可留空）' }).height(100).maxLength(200)
              .fontSize(15).backgroundColor(LEARNING_BG).borderRadius(10).enabled(this.view.editable)
              .onChange((value: string): void => this.edit('note', value))
            Row({ space: 8 }) {
              Checkbox({ name: 'verified' }).width(44).height(44).padding(10).select(this.view.formAgreed)
                .enabled(this.view.editable)
                .onChange((value: boolean): void => {
                  if (this.view.editable) {
                    getLearningController()?.sceneWorkbench.setFormAgreed(value);
                  }
                })
              Text('确认以上信息无误').fontSize(14).fontColor(LEARNING_INK)
            }.width('100%')
          }
        }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
          .onAreaChange((_old, area): void => {
            if (Number(area.width) > 0 && Number(area.height) > 0) {
              this.positionRendered();
            }
          })
        Text(`本步校验：${this.view.formStepIssues.length > 0 ? this.view.formStepIssues.join('；') : '通过'}`)
          .fontSize(13).fontColor(LEARNING_INK).width('100%')
        Text(`整表待完善 ${this.view.formIssues.length} 项`).fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        Row({ space: 10 }) {
          Button('上一步', { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
            .onClick((): void => { getLearningController()?.sceneWorkbench.previousFormStep(); })
          Button('下一步', { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
            .onClick((): void => { getLearningController()?.sceneWorkbench.nextFormStep(); })
        }.width('100%')
        Button('保存草稿').width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .enabled(this.view.editable).onClick((): void => { getLearningController()?.sceneWorkbench.saveForm(); })
        Button('校验并确认完成', { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10).enabled(this.view.editable)
          .onClick((): void => { getLearningController()?.sceneWorkbench.confirmForm(); })
        Text(this.view.formConfirmed ? '已确认完成（仅本地示例，不发送服务器）' : '尚未确认完成')
          .fontSize(13).fontColor(LEARNING_INK).width('100%')
        Text(this.view.error.length > 0 ? this.view.error : this.view.notice)
          .fontSize(14).fontColor(LEARNING_INK).width('100%')
      }.width('100%').padding(20).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor(LEARNING_BG).align(Alignment.TopStart)
  }
}
