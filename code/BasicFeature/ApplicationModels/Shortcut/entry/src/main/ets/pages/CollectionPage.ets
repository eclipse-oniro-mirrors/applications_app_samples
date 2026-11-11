import { BG, CARD, TEXT, MUTED, ACCENT, LINE, PageHeader, EmptyState, FieldRow } from '../components/Ui';
import { BusinessSnapshot, CollectionItem, businessStore } from '../business/BusinessStore';
import { PageKey } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';

@Entry
@Component
struct CollectionPage {
  @State private view: BusinessSnapshot = new BusinessSnapshot();
  @State private selected: CollectionItem = new CollectionItem();
  @State private detailOpen: boolean = false;
  private subscribed: boolean = false;
  private changed: () => void = () => {
    this.view = businessStore.snapshot();
  };

  aboutToAppear(): void {
    this.activate();
  }

  onPageShow(): void {
    this.activate();
  }

  onPageHide(): void {
    this.detailOpen = false;
    this.deactivate();
  }

  aboutToDisappear(): void {
    this.deactivate();
  }

  onBackPress(): boolean {
    if (this.detailOpen) {
      this.detailOpen = false;
    } else {
      void appNavigation.back();
    }
    return true;
  }

  private activate(): void {
    if (!this.subscribed) {
      businessStore.subscribe(this.changed);
      this.subscribed = true;
    }
    this.changed();
    appNavigation.activate(PageKey.COLLECTION, this.changed);
  }

  private deactivate(): void {
    if (this.subscribed) {
      businessStore.unsubscribe(this.changed);
      this.subscribed = false;
    }
    appNavigation.deactivate(PageKey.COLLECTION);
  }

  private openDetail(item: CollectionItem): void {
    this.selected = new CollectionItem(item.id, item.title, item.category, item.content);
    this.detailOpen = true;
  }

  @Builder
  private detailPanel() {
    Column({ space: 16 }) {
      Text(this.selected.title)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(TEXT)
        .width('100%')
      Text(this.selected.category).fontSize(14).fontColor(MUTED).width('100%')
      Button(this.view.favoriteIds.indexOf(this.selected.id) >= 0 ? '取消收藏' : '收藏',
        { type: ButtonType.Normal })
        .width('100%').height(44).fontSize(14).fontColor(ACCENT)
        .backgroundColor($r('app.color.accent_soft'))
        .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
        .onClick(() => { void businessStore.toggleFavorite(this.selected.id); })
      Scroll() {
        FieldRow({ label: '内容', value: this.selected.content })
      }
      .width('100%')
      .layoutWeight(1)
      Button('关闭')
        .width('100%')
        .height(44)
        .fontSize(16)
        .fontColor($r('app.color.on_accent'))
        .backgroundColor(ACCENT)
        .onClick(() => {
          this.detailOpen = false;
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 28, bottom: 24 })
    .backgroundColor(CARD)
  }

  @Builder
  private collectionCard(item: CollectionItem) {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Column({ space: 8 }) {
          Text(item.title).fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          Text(item.category).fontSize(14).fontColor(MUTED).width('100%')
        }
        .layoutWeight(1)
        Button(this.view.favoriteIds.indexOf(item.id) >= 0 ? '★' : '☆', { type: ButtonType.Normal })
          .fontSize(20)
          .fontColor(ACCENT)
          .backgroundColor(Color.Transparent)
          .height(44).width(44)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => { void businessStore.toggleFavorite(item.id); })
        Text('查看').fontSize(14).fontColor(ACCENT)
      }
      .width('100%')
      Text(item.content)
        .fontSize(14)
        .fontColor(MUTED)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(CARD)
    .border({ width: 1, color: LINE })
    .borderRadius(16)
    .onClick(() => this.openDetail(item))
    .accessibilityText(`${item.title}，查看详情`)
  }

  build() {
    Column() {
      PageHeader({
        title: '收藏资料',
        subtitle: `${this.view.collections.length} 份资料`,
        onBack: () => {
          void appNavigation.back();
        }
      })
      Scroll() {
        Column({ space: 16 }) {
          if (this.view.storageRecoveryRequired) {
            Text(this.view.error).fontSize(14).fontColor(ACCENT).width('100%')
            Button('重新读取核对').id('collection-storage-recovery').height(44).fontSize(14).enabled(!this.view.busy)
              .onClick(() => { void businessStore.recoverStorage(); })
          }
          TextInput({ text: this.view.collectionQuery, placeholder: '搜索标题或内容' })
            .fontSize(14)
            .height(44)
            .backgroundColor(CARD)
            .borderRadius(10)
            .onChange((value: string) => businessStore.setCollectionQuery(value))
          Row({ space: 8 }) {
            ForEach(['全部', '效率', '工作', '阅读'], (category: string) => {
              Button(category, { type: ButtonType.Normal })
                .fontSize(14)
                .height(44)
                .layoutWeight(1)
                .fontColor(this.view.collectionCategory === category ? $r('app.color.on_accent') : ACCENT)
                .backgroundColor(this.view.collectionCategory === category ? ACCENT : $r('app.color.accent_soft'))
                .borderRadius(9)
                .onClick(() => businessStore.setCollectionCategory(category))
            }, (category: string) => category)
          }
          .width('100%')
          Button(this.view.favoritesOnly ? '只看收藏：开' : '只看收藏：关', { type: ButtonType.Normal })
            .width('100%')
            .height(44)
            .fontSize(14)
            .fontColor(this.view.favoritesOnly ? $r('app.color.on_accent') : ACCENT)
            .backgroundColor(this.view.favoritesOnly ? ACCENT : CARD)
            .borderRadius(9)
            .onClick(() => businessStore.setFavoritesOnly(!this.view.favoritesOnly))
          if (this.view.visibleCollections.length === 0) {
            EmptyState({ title: '没有匹配的资料' })
          } else {
            ForEach(this.view.visibleCollections, (item: CollectionItem) => {
              this.collectionCard(item)
            }, (item: CollectionItem) => item.id)
          }
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 24 })
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.TopStart)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(BG)
    .bindSheet($$this.detailOpen, this.detailPanel(), { height: SheetSize.MEDIUM, showClose: true })
  }
}
