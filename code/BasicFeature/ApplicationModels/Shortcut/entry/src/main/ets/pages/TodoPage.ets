import { BG, CARD, TEXT, MUTED, ACCENT, OK, PageHeader, StatusBanner, EmptyState } from '../components/Ui';
import { BusinessSnapshot, TodoDateSummary, TodoItem, businessStore, localDateKey } from '../business/BusinessStore';
import { PageKey } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';

@Entry
@Component
struct TodoPage {
  @State private view: BusinessSnapshot = new BusinessSnapshot();
  @State private newTodoTitle: string = '';
  @State private editingTodoId: string = '';
  @State private editingTitle: string = '';
  private subscribed: boolean = false;
  private changed: () => void = () => {
    this.view = businessStore.snapshot();
  };
  private revisit: () => void = () => {
    this.changed();
    if (this.view.ready && !this.view.busy && this.view.todoFollowToday &&
      this.view.todoDate !== localDateKey()) {
      void businessStore.refreshTodos();
    }
  };

  aboutToAppear(): void {
    this.activate();
  }

  onPageShow(): void {
    this.activate();
  }

  onPageHide(): void {
    this.deactivate();
  }

  aboutToDisappear(): void {
    this.deactivate();
  }

  onBackPress(): boolean {
    void appNavigation.back();
    return true;
  }

  private activate(): void {
    if (!this.subscribed) {
      businessStore.subscribe(this.changed);
      this.subscribed = true;
    }
    this.revisit();
    appNavigation.activate(PageKey.TODO, this.revisit);
  }

  private deactivate(): void {
    if (this.subscribed) {
      businessStore.unsubscribe(this.changed);
      this.subscribed = false;
    }
    appNavigation.deactivate(PageKey.TODO);
  }

  private completedCount(): number {
    return this.view.todos.filter((item: TodoItem) => item.done).length;
  }

  private confirmReset(): void {
    this.getUIContext().showAlertDialog({
      title: '恢复当日样例',
      message: `恢复 ${localDateKey()} 的3条待办？`,
      primaryButton: { value: '取消', action: () => {} },
      secondaryButton: {
        value: '恢复',
        action: () => {
          void businessStore.resetToday();
        }
      }
    });
  }

  private startEdit(item: TodoItem): void {
    this.editingTodoId = item.id;
    this.editingTitle = item.title;
  }

  private saveEdit(): void {
    const id: string = this.editingTodoId;
    if (id.length === 0) {
      return;
    }
    void businessStore.updateTodo(id, this.editingTitle).then((ok: boolean) => {
      if (ok) {
        this.editingTodoId = '';
        this.editingTitle = '';
      }
    });
  }

  @Builder
  private todoCard(item: TodoItem) {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Checkbox({ name: item.id }).width(24).height(24).margin(10)
          .responseRegion({ x: -10, y: -10, width: 44, height: 44 })
          .select(item.done)
          .selectedColor(OK)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onChange((value: boolean) => {
            void businessStore.setTodoDone(item.id, value);
          })
        if (this.editingTodoId === item.id) {
          TextInput({ text: this.editingTitle })
            .fontSize(15).layoutWeight(1).height(44)
            .onChange((value: string) => { this.editingTitle = value; })
        } else {
          Text(item.title)
            .fontSize(15)
            .fontColor(item.done ? MUTED : TEXT)
            .decoration({ type: item.done ? TextDecorationType.LineThrough : TextDecorationType.None })
            .layoutWeight(1)
        }
      }
      .width('100%')
      if (this.editingTodoId === item.id) {
        Row({ space: 8 }) {
          Button('保存', { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(ACCENT)
            .enabled(!this.view.busy).onClick(() => this.saveEdit())
          Button('取消', { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor(MUTED).backgroundColor(BG)
            .onClick(() => { this.editingTodoId = ''; this.editingTitle = ''; })
        }
        .width('100%')
      } else {
        Row({ space: 8 }) {
          Text(item.done ? '已完成' : '待完成').fontSize(14).fontColor(item.done ? OK : MUTED).layoutWeight(1)
          Button('编辑', { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
            .backgroundColor(Color.Transparent).height(44).onClick(() => this.startEdit(item))
          Button('删除', { type: ButtonType.Normal }).fontSize(14).fontColor('#C23F4A')
            .backgroundColor(Color.Transparent).height(44)
            .onClick(() => { void businessStore.deleteTodo(item.id); })
        }
        .width('100%')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(CARD)
    .borderRadius(16)
  }

  @Builder
  private dateBar() {
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Button('‹', { type: ButtonType.Normal })
          .height(44).width(44).fontSize(16).fontColor(ACCENT).backgroundColor(CARD)
          .borderRadius(9)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => { businessStore.shiftTodoDate(-1); })
        Button('今天', { type: ButtonType.Normal })
          .layoutWeight(1).height(44).fontSize(14)
          .fontColor(this.view.todoFollowToday ? '#FFFFFF' : ACCENT)
          .backgroundColor(this.view.todoFollowToday ? ACCENT : CARD)
          .borderRadius(9)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
          .onClick(() => { businessStore.shiftTodoDate(0); })
        Button('›', { type: ButtonType.Normal })
          .height(44).width(44).fontSize(16).fontColor(ACCENT).backgroundColor(CARD)
          .borderRadius(9)
          .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired &&
            !this.view.todoFollowToday)
          .onClick(() => { businessStore.shiftTodoDate(1); })
      }
      .width('100%')
      Scroll() {
        Row({ space: 8 }) {
          ForEach(this.view.dateSummaries, (summary: TodoDateSummary) => {
            Column({ space: 2 }) {
              Text(summary.date).fontSize(14)
                .fontColor(this.view.todoDate === summary.date ? '#FFFFFF' : TEXT)
              Text(`${summary.done}/${summary.total}`).fontSize(12)
                .fontColor(this.view.todoDate === summary.date ? '#FFFFFF' : MUTED)
            }
            .constraintSize({ minWidth: 64, minHeight: 44 }).justifyContent(FlexAlign.Center)
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .backgroundColor(this.view.todoDate === summary.date ? ACCENT : CARD)
            .borderRadius(10)
            .onClick(() => { businessStore.selectTodoDate(summary.date); })
          }, (summary: TodoDateSummary) => `${summary.date}-${summary.total}-${summary.done}`)
        }
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      if (!this.view.todoFollowToday) {
        Text('修改将保存在所选日期')
          .fontSize(12).fontColor(MUTED).width('100%')
      }
    }
    .width('100%')
    .padding(12)
    .backgroundColor(CARD)
    .borderRadius(14)
  }

  build() {
    Column() {
      PageHeader({
        title: this.view.todoFollowToday ? '今日待办' : '待办 · 历史',
        onBack: () => {
          void appNavigation.back();
        }
      })
      Scroll() {
        Column({ space: 16 }) {
          this.dateBar()
          Row() {
            Column({ space: 6 }) {
              Text(this.view.todoDate).fontSize(16).fontColor(TEXT).width('100%')
              Text(`已完成 ${this.completedCount()} / ${this.view.todos.length}`)
                .fontSize(14)
                .fontColor(MUTED)
                .width('100%')
            }
            .layoutWeight(1)
            Button('刷新')
              .height(44)
              .fontSize(14)
              .fontColor(ACCENT)
              .backgroundColor(CARD)
              .enabled(!this.view.loading && !this.view.busy)
              .onClick(() => {
                void businessStore.refreshTodos();
              })
          }
          .width('100%')
          StatusBanner({
            message: this.view.loading ? '读取中…' : (this.view.busy ? '保存中…' :
              (this.view.error.length > 0 ? this.view.error : this.view.message)),
            error: !this.view.loading && !this.view.busy && this.view.error.length > 0
          })
          if (this.view.storageRecoveryRequired) {
            Button('重新读取核对').id('todo-storage-recovery').height(44).fontSize(14).enabled(!this.view.busy)
              .onClick(() => { void businessStore.recoverStorage(); })
          }
          Row({ space: 8 }) {
            TextInput({ text: this.newTodoTitle, placeholder: '新增待办（最多 60 字）' })
              .fontSize(14).height(44).layoutWeight(1).backgroundColor(CARD)
              .onChange((value: string) => { this.newTodoTitle = value; })
            Button('添加', { type: ButtonType.Normal }).height(44).fontSize(14)
              .fontColor('#FFFFFF').backgroundColor(ACCENT)
              .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired &&
                this.newTodoTitle.trim().length > 0)
              .onClick(() => {
                void businessStore.addTodo(this.newTodoTitle).then((ok: boolean) => {
                  if (ok) { this.newTodoTitle = ''; }
                });
              })
          }
          .width('100%')
          Row({ space: 8 }) {
            ForEach(['全部', '未完成', '已完成'], (filter: string) => {
              Button(filter, { type: ButtonType.Normal })
                .layoutWeight(1).height(44).fontSize(14)
                .fontColor(this.view.todoFilter === filter ? '#FFFFFF' : ACCENT)
                .backgroundColor(this.view.todoFilter === filter ? ACCENT : CARD)
                .borderRadius(9)
                .onClick(() => businessStore.setTodoFilter(filter))
            }, (filter: string) => filter)
          }
          .width('100%')
          if (this.view.visibleTodos.length === 0 && !this.view.loading) {
            EmptyState({ title: this.view.todoFilter === '全部' ? '暂无待办' : '没有匹配的待办' })
          } else {
            ForEach(this.view.visibleTodos, (item: TodoItem) => {
              this.todoCard(item)
            }, (item: TodoItem) => `${item.id}-${item.done}-${this.view.busy}`)
          }
          Button('恢复当日样例', { type: ButtonType.Normal })
            .width('100%')
            .height(44)
            .fontSize(15)
            .fontColor(ACCENT)
            .backgroundColor(CARD)
            .borderRadius(12)
            .enabled(this.view.ready && !this.view.busy && !this.view.storageRecoveryRequired)
            .onClick(() => this.confirmReset())
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
  }
}
