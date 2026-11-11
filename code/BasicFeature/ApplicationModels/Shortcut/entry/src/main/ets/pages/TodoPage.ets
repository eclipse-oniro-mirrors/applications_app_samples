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

import { businessLabel } from '../i18n/BusinessLabels';
import { uiText } from '../i18n/Strings';
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
      title: uiText("shortcut_text_0279"),
      message: uiText("shortcut_text_0276", [String(localDateKey())]),
      primaryButton: { value: uiText("shortcut_text_0452"), action: () => {} },
      secondaryButton: {
        value: uiText("shortcut_text_0275"),
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
          Button(uiText("shortcut_text_0042"), { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(ACCENT)
            .enabled(!this.view.busy).onClick(() => this.saveEdit())
          Button(uiText("shortcut_text_0452"), { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor(MUTED).backgroundColor(BG)
            .onClick(() => { this.editingTodoId = ''; this.editingTitle = ''; })
        }
        .width('100%')
      } else {
        Row({ space: 8 }) {
          Text(item.done ? uiText("shortcut_text_0679") : uiText("shortcut_text_0206")).fontSize(14).fontColor(item.done ? OK : MUTED).layoutWeight(1)
          Button(uiText("shortcut_text_0076"), { type: ButtonType.Normal }).fontSize(14).fontColor(ACCENT)
            .backgroundColor(Color.Transparent).height(44).onClick(() => this.startEdit(item))
          Button(uiText("shortcut_text_0494"), { type: ButtonType.Normal }).fontSize(14).fontColor('#C23F4A')
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
        Button(uiText("shortcut_text_0337"), { type: ButtonType.Normal })
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
        Text(uiText("shortcut_text_0624"))
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
        title: this.view.todoFollowToday ? uiText("shortcut_text_0334") : uiText("shortcut_text_0191"),
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
              Text(uiText("shortcut_text_0680", [String(this.completedCount()), String(this.view.todos.length)]))
                .fontSize(14)
                .fontColor(MUTED)
                .width('100%')
            }
            .layoutWeight(1)
            Button(uiText("shortcut_text_0533"))
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
            message: this.view.loading ? uiText("shortcut_text_0225") : (this.view.busy ? uiText("shortcut_text_0055") :
              (this.view.error.length > 0 ? this.view.error : this.view.message)),
            error: !this.view.loading && !this.view.busy && this.view.error.length > 0
          })
          if (this.view.storageRecoveryRequired) {
            Button(uiText("shortcut_text_0778")).id('todo-storage-recovery').height(44).fontSize(14).enabled(!this.view.busy)
              .onClick(() => { void businessStore.recoverStorage(); })
          }
          Row({ space: 8 }) {
            TextInput({ text: this.newTodoTitle, placeholder: uiText("shortcut_text_0623") })
              .fontSize(14).height(44).layoutWeight(1).backgroundColor(CARD)
              .onChange((value: string) => { this.newTodoTitle = value; })
            Button(uiText("shortcut_text_0548"), { type: ButtonType.Normal }).height(44).fontSize(14)
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
              Button(businessLabel(filter), { type: ButtonType.Normal })
                .layoutWeight(1).height(44).fontSize(14)
                .fontColor(this.view.todoFilter === filter ? '#FFFFFF' : ACCENT)
                .backgroundColor(this.view.todoFilter === filter ? ACCENT : CARD)
                .borderRadius(9)
                .onClick(() => businessStore.setTodoFilter(filter))
            }, (filter: string) => filter)
          }
          .width('100%')
          if (this.view.visibleTodos.length === 0 && !this.view.loading) {
            EmptyState({ title: this.view.todoFilter === '全部' ? uiText("shortcut_text_0720") : uiText("shortcut_text_0392") })
          } else {
            ForEach(this.view.visibleTodos, (item: TodoItem) => {
              this.todoCard(item)
            }, (item: TodoItem) => `${item.id}-${item.done}-${this.view.busy}`)
          }
          Button(uiText("shortcut_text_0279"), { type: ButtonType.Normal })
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
