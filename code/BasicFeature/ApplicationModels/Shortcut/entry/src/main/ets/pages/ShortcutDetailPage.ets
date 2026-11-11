import { shortcutManager } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { ACCENT, BG, CARD, EmptyState, FieldRow, MUTED, PageHeader, StatusBanner, TEXT } from '../components/Ui';
import { FeatureInfo, PageKey, ShortcutItem, ShortcutView, featureForId, sourceText } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';

@Entry
@Component
struct ShortcutDetailPage {
  @State view: ShortcutView = new ShortcutView();
  @State item: ShortcutItem | undefined = undefined;
  @State private detailsExpanded: boolean = false;
  private shortcutId: string = '';
  private subscription: number = -1;
  private active: boolean = false;

  aboutToAppear(): void { this.activate(); }
  onPageShow(): void { this.activate(); }
  onPageHide(): void { this.deactivate(); }
  aboutToDisappear(): void { this.deactivate(); }

  private activate(): void {
    if (this.active) { return; }
    this.active = true;
    const params = router.getParams() as Record<string, string>;
    this.shortcutId = params === undefined ? '' : params['shortcutId'];
    this.subscription = shortcutService.subscribe(() => this.update());
    this.update();
    appNavigation.activate(PageKey.DETAIL, () => this.update());
  }

  private deactivate(): void {
    if (!this.active) { return; }
    this.active = false;
    shortcutService.unsubscribe(this.subscription);
    appNavigation.deactivate(PageKey.DETAIL);
  }

  private update(): void {
    this.view = shortcutService.snapshot();
    this.item = this.view.items.find((item: ShortcutItem) => item.id === this.shortcutId);
  }

  private openFeature(): void {
    const feature: FeatureInfo | undefined = featureForId(this.shortcutId);
    if (feature !== undefined) { appNavigation.open(feature.page); }
  }

  build() {
    Column() {
      PageHeader({ title: '快捷方式详情', onBack: (): void => { appNavigation.back(); } })
      Scroll() {
        Column({ space: 16 }) {
          StatusBanner({ message: this.view.queryError || this.view.supportError, error: true })
          if (this.item !== undefined) {
            this.detailContent(this.item)
          } else {
            EmptyState({ title: '入口不存在', detail: '刷新列表后重新查看' })
          }
          Button(this.view.querying ? '正在查询' : '重新查询').width('100%').height(46)
            .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
            .enabled(this.view.supported && !this.view.busy)
            .onClick(() => { shortcutService.refresh(); })
        }.width('100%').padding({ left: 20, right: 20, bottom: 28 })
      }.width('100%').layoutWeight(1).align(Alignment.TopStart).scrollBar(BarState.Off)
    }.width('100%').height('100%').backgroundColor(BG)
  }

  @Builder
  private detailContent(item: ShortcutItem) {
    Column({ space: 14 }) {
      Text(item.title).fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
      Text(item.visible ? '已显示' : '已隐藏').fontSize(14).fontColor(ACCENT).width('100%')
      StatusBanner({ message: item.error || item.status, error: item.error.length > 0 })
      Row({ space: 12 }) {
        Button(item.visible ? '隐藏入口' : '显示入口').height(44).layoutWeight(1)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0)
          .onClick(() => { shortcutService.setVisible(item.id, !item.visible); })
        Button('打开功能').height(44).layoutWeight(1).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent')).enabled(featureForId(item.id) !== undefined)
          .onClick(() => this.openFeature())
      }.width('100%')
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)

    Button({ type: ButtonType.Normal }) {
      Row() {
        Text('入口信息').fontSize(15).fontColor(TEXT).layoutWeight(1)
        Text(this.detailsExpanded ? '收起' : '查看详情').fontSize(14).fontColor(ACCENT)
      }.width('100%')
    }.height(52).width('100%').padding({ left: 16, right: 16 }).backgroundColor(CARD).borderRadius(16)
      .onClick(() => { this.detailsExpanded = !this.detailsExpanded; })

    if (this.detailsExpanded) {
    Column() {
      Text('基本信息').fontSize(18).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
      FieldRow({ label: 'ID', value: item.id })
      FieldRow({ label: '包名', value: item.raw.bundleName })
      FieldRow({ label: '模块', value: item.raw.moduleName || '未返回' })
      FieldRow({ label: '宿主 Ability', value: item.raw.hostAbility || '未返回' })
      FieldRow({ label: '来源', value: `${sourceText(item.raw.sourceType)} (${item.raw.sourceType})` })
      FieldRow({ label: '应用分身索引', value: `${item.raw.appIndex}` })
      FieldRow({ label: 'visible', value: item.visibleExplicit ? `${item.raw.visible}` : '缺省 · 显示' })
      if (item.raw.label !== undefined) {
        FieldRow({ label: '标签原值', value: item.raw.label })
      }
      if (item.raw.labelId !== undefined) {
        FieldRow({ label: '标签资源 ID', value: `${item.raw.labelId}` })
      }
      if (item.raw.icon !== undefined) {
        FieldRow({ label: '图标', value: item.raw.icon })
      }
      if (item.raw.iconId !== undefined) {
        FieldRow({ label: '图标资源 ID', value: `${item.raw.iconId}` })
      }
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)

    ForEach(item.raw.wants || [], (want: shortcutManager.ShortcutWant, index: number) => {
      Column() {
        Text(`目标 ${index + 1}`).fontSize(18).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
        FieldRow({ label: '目标包', value: want.targetBundle })
        FieldRow({ label: '目标模块', value: want.targetModule || '未返回' })
        FieldRow({ label: '目标 Ability', value: want.targetAbility })
        Text('参数').fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          .margin({ top: 10 })
        if (want.parameters === undefined || want.parameters.length === 0) {
          Text('暂无参数').fontSize(14).fontColor(MUTED).width('100%').margin({ top: 10 })
        }
        ForEach(want.parameters || [], (parameter: shortcutManager.ParameterItem) => {
          FieldRow({ label: parameter.key, value: parameter.value })
        }, (parameter: shortcutManager.ParameterItem) => `${parameter.key}|${parameter.value}`)
      }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
    }, (want: shortcutManager.ShortcutWant, index: number) => `${index}|${want.targetBundle}|${want.targetAbility}`)
    }
  }
}
