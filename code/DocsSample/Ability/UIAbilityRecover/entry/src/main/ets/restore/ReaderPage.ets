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

/**
 * 断点续读页面（方案 A 的 NavDestination 示例）。
 * 演示：数据通道（平时发布）、恢复消费（一次性）、空值兜底（防白屏）、.recoverable(true)。
 */
@Component
export struct ReaderPage {
  @State bookId: string = '';
  @State chapterIndex: number = 1;
  @State progress: number = 0;
  @State draft: string = '';
  @State source: string = '冷启加载';
  private restoredFromChannel: boolean = false;

  // [Start page_consume]
  aboutToAppear(): void {
    // 恢复消费：优先使用 Ability 层中转的恢复数据，取出即删，防止重复消费
    const restored = AppStorage.get<Record<string, Object>>('restore.reader');
    if (restored !== undefined) {
      AppStorage.delete('restore.reader');
      this.restoredFromChannel = true;
      this.bookId = (restored['bookId'] as string) ?? '';
      this.chapterIndex = (restored['chapterIndex'] as number) ?? 1;
      this.progress = (restored['progress'] as number) ?? 0;
      // 超限草稿单独走落盘通道，恢复成功时优先于随数据带回的短草稿
      const draftFromBlob = AppStorage.get<string>('restore.reader.draft');
      if (draftFromBlob !== undefined) {
        AppStorage.delete('restore.reader.draft');
        this.draft = draftFromBlob;
      } else {
        this.draft = (restored['draft'] as string) ?? '';
      }
      this.source = '恢复启动';
      this.reportState();
      return; // 不走正常冷启初始化
    }
  }
  // [End page_consume]

  // [Start reader_state_report]
  /** 数据通道：关键状态变化时把可序列化状态发布到 AppStorage，onSaveState 同步读取。
   *  只放定位键与轻量数据，不放函数/类实例/Map。 */
  private reportState(): void {
    AppStorage.setOrCreate('reader.state', {
      'bookId': this.bookId,
      'chapterIndex': this.chapterIndex,
      'progress': this.progress
    } as Record<string, Object>);
    // 草稿单独一路发布，onSaveState 按长度决定随数据保存还是落盘引用
    AppStorage.setOrCreate('reader.draft', this.draft);
  }
  // [End reader_state_report]

  /** 正常冷启：按定位键重新加载初始状态。 */
  private loadFresh(): void {
    this.chapterIndex = 1;
    this.progress = 0;
    this.source = '冷启加载';
    this.reportState();
  }

  build() {
    NavDestination() {
      Column({ space: 12 }) {
        Text(`书籍：${this.bookId}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(`第${this.chapterIndex}章　进度：${this.progress}%　来源：${this.source}`)
          .fontSize(16)
        Progress({ value: this.progress, total: 100 })
          .width('90%')
        Button('模拟翻页（进度 +10）')
          .onClick(() => {
            this.progress += 10;
            if (this.progress >= 100) {
              this.progress = 0;
              this.chapterIndex += 1;
            }
            this.reportState();
          })
        TextArea({ text: this.draft, placeholder: '阅读笔记草稿（超过 2KB 时演示落盘引用）' })
          .height(120)
          .width('90%')
          .onChange((value: string) => {
            this.draft = value;
            this.reportState();
          })
        Text('退到后台后被系统回收，再次启动将恢复到当前进度')
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('阅读页（断点续读）')
    .onReady((ctx: NavDestinationContext) => {
      this.handleParam(ctx);
    })
    // 三件套之页面级：数据通道与空值兜底完成后才允许开启（API 14+）
    .recoverable(true)
  }

  // [Start empty_param_fallback]
  /** 空值兜底：系统恢复的页面 param 经序列化窄约束后可能为空/残缺，必须处理，否则白屏。 */
  private handleParam(ctx: NavDestinationContext): void {
    const param = ctx.pathInfo?.param as Record<string, Object> | undefined;
    // 路径 1：param 有效 → 用定位键重新加载数据，不依赖原始 param 中的类实例/回调
    if (param !== undefined && param['bookId'] !== undefined) {
      this.bookId = param['bookId'] as string;
      if (!this.restoredFromChannel) {
        this.loadFresh();
      }
      return;
    }
    // 路径 2：系统恢复但 param 为空 → 尝试从 AppStorage 恢复通道取
    const restored = AppStorage.get<Record<string, Object>>('restore.reader');
    if (restored !== undefined) {
      AppStorage.delete('restore.reader');
      this.restoredFromChannel = true;
      this.bookId = (restored['bookId'] as string) ?? '';
      this.chapterIndex = (restored['chapterIndex'] as number) ?? 1;
      this.progress = (restored['progress'] as number) ?? 0;
      this.draft = (restored['draft'] as string) ?? '';
      this.source = '恢复启动';
      this.reportState();
      return;
    }
    // 路径 3：兜底 → 退回上一页，避免白屏
    ctx.pathStack?.pop();
  }
  // [End empty_param_fallback]
}
