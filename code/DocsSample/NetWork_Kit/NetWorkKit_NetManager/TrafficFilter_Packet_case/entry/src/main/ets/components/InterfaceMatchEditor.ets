import { InterfaceMatchForm } from '../model/RuleFormModel';

@ComponentV2
export struct InterfaceMatchEditor {
  @Param form: InterfaceMatchForm = new InterfaceMatchForm();
  @Param label: string = 'InterfaceMatch';

  build() {
    Column({ space: 8 }) {
      Row({ space: 8 }) {
        Text(this.label)
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .layoutWeight(1)
        Checkbox()
          .select(this.form.enabled)
          .onChange((v: boolean) => { this.form.enabled = v; })
        Text('enabled')
          .fontSize(13)
          .fontColor($r('app.color.text_secondary'))
      }.width('100%')

      Row({ space: 8 }) {
        Text('ifName').fontSize(13).width(90)
        TextInput({ text: this.form.ifName })
          .enabled(this.form.enabled)
          .onChange((v: string) => { this.form.ifName = v; })
          .layoutWeight(1)
      }.width('100%')

      Row({ space: 16 }) {
        Row({ space: 6 }) {
          Checkbox()
            .select(this.form.invert)
            .enabled(this.form.enabled)
            .onChange((v: boolean) => { this.form.invert = v; })
          Text('invert').fontSize(13).fontColor($r('app.color.text_secondary'))
        }
        Row({ space: 6 }) {
          Checkbox()
            .select(this.form.isPrefix)
            .enabled(this.form.enabled)
            .onChange((v: boolean) => { this.form.isPrefix = v; })
          Text('isPrefix').fontSize(13).fontColor($r('app.color.text_secondary'))
        }
      }.width('100%')
    }
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(8)
    .opacity(this.form.enabled ? 1 : 0.5)
  }
}
