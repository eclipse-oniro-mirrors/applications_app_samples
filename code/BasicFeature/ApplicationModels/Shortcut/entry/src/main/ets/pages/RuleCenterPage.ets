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

import { uiText } from '../i18n/Strings';
import { BG, CARD, TEXT, MUTED, ACCENT } from '../components/Ui';
import { router } from '@kit.ArkUI';
import {
  RoutePage, RouteRequest, auditRoutes, resolveRoute, routeLines, routesOfPage
} from '../business/EntryRoute';
import {
  TodoItem, TodoState, auditTodoRules, summarizeTodos, todoRuleLines
} from '../business/TodoRules';
import {
  SearchDoc, auditDocs, highlight, search, tokenSummary, uniqueTokens
} from '../business/SearchIndex';
import {
  CollectionItem, CollectionAction, auditCollectionRules, govern, pinQuota, ruleLines
} from '../business/CollectionRules';
import {
  FilterChain, FilterTarget, auditChains, chainCounts, chainLines, chainNames, mergeChains,
  PRESET_CHAINS
} from '../business/FilterChain';
import {
  EntryRequest, EntrySource, auditEntry, parseUri, resolveEntry, ruleLines as entryRuleLines,
  sourceLines
} from '../business/LaunchIntent';
import {
  SaveInput, TrashBin, decideSave, saveAdvice, saveLines, trashLines
} from '../business/NoteTrash';
import {
  Priority, RepeatKind, TodoDue, dueLines, dueSummary, nextOccurrence, overdueDays
} from '../business/DuePolicy';
import {
  IndexedDoc, TagIndex, normalizeTags, searchLines as tagSearchLines, search as tagSearch, tagLines
} from '../business/TagIndex';

function sampleCollections(now: number): CollectionItem[] {
  const recent: CollectionItem = new CollectionItem('c1', '近期笔记', '一小时内整理的内容');
  recent.source = 'note';
  recent.tags = ['便签'];
  recent.savedAt = now - 3600000;
  const duplicate: CollectionItem = new CollectionItem('c2', '近期笔记', '重复收藏');
  duplicate.source = 'note';
  duplicate.tags = ['便签'];
  duplicate.savedAt = now - 7200000;
  const old: CollectionItem = new CollectionItem('c3', '去年的资料', '超过一年未读');
  old.source = 'web';
  old.tags = ['资料'];
  old.savedAt = now - 400 * 86400000;
  const messy: CollectionItem = new CollectionItem('c4', '标签过多', '标签需要整理');
  messy.source = 'web';
  messy.tags = ['a', 'b', 'c', 'd', 'e', 'f'];
  messy.savedAt = now - 86400000;
  const pinned: CollectionItem = new CollectionItem('c5', '置顶资料', '手工置顶');
  pinned.source = 'web';
  pinned.tags = ['资料'];
  pinned.savedAt = now - 10 * 86400000;
  pinned.pinned = true;
  return [recent, duplicate, old, messy, pinned];
}

function sampleTargets(): FilterTarget[] {
  const open: FilterTarget = new FilterTarget('t1', '整理今日待办', 'open');
  open.tags = ['便签'];
  open.group = '工作中';
  open.pinned = true;
  open.updatedAt = 1700000000000;
  const done: FilterTarget = new FilterTarget('t2', '已完成事项', 'done');
  done.tags = ['收藏'];
  done.group = '归档';
  done.updatedAt = 1600000000000;
  const doing: FilterTarget = new FilterTarget('t3', '测试用例整理', 'doing');
  doing.tags = ['便签', '测试'];
  doing.group = '工作中';
  doing.updatedAt = 1690000000000;
  return [open, done, doing];
}

@Entry
@Component
struct RuleCenterPage {
  @State private expandedTitles: string[] = [];
  @State private routeLinesState: string[] = [];
  @State private todoLinesState: string[] = [];
  @State private searchLinesState: string[] = [];
  @State private collectionLinesState: string[] = [];
  @State private filterLinesState: string[] = [];
  @State private entryLinesState: string[] = [];

  aboutToAppear(): void {
    this.rebuild();
  }

  onPageShow(): void {
    this.rebuild();
  }

  private sampleDocs(): SearchDoc[] {
    const note: SearchDoc = new SearchDoc('demo-note', '便签示例', '这是一条便签示例，用于演示本地检索。');
    note.tags = ['便签', 'note'];
    note.updatedAt = 1700000000000;
    const todo: SearchDoc = new SearchDoc('demo-todo', '待办示例', '今日待办包含三条任务，其中一条已逾期。');
    todo.tags = ['待办', 'todo'];
    todo.updatedAt = 1700000000000;
    const collection: SearchDoc = new SearchDoc('demo-collection', '收藏示例', '收藏的常用资料，支持按标签筛选。');
    collection.tags = ['收藏', 'collection'];
    collection.updatedAt = 1700000000000;
    return [note, todo, collection];
  }

  private sampleTodos(): TodoItem[] {
    const urgent: TodoItem = new TodoItem('demo-1', '整理今日待办', 3);
    urgent.state = TodoState.DOING;
    urgent.dueAt = 1600000000000;
    urgent.estimateMinutes = 15;
    urgent.tags = ['待办'];
    const normal: TodoItem = new TodoItem('demo-2', '补充便签内容', 2);
    normal.dueAt = 1900000000000;
    normal.estimateMinutes = 45;
    const later: TodoItem = new TodoItem('demo-3', '整理收藏标签', 1);
    later.state = TodoState.DEFERRED;
    later.estimateMinutes = 180;
    return [urgent, normal, later];
  }

  @State private noteSaveLinesState: string[] = [];
  @State private trashLinesState: string[] = [];
  @State private dueBucketLinesState: string[] = [];
  @State private tagSearchLinesState: string[] = [];

  private rebuildNoteRules(now: number): void {
    const save: string[] = [];
    const clean: SaveInput = new SaveInput();
    clean.baselineRevision = 3;
    clean.localRevision = 4;
    clean.remoteRevision = 3;
    save.push(uiText("shortcut_text_0756", [String(saveAdvice(decideSave(clean)))]));
    const branch: SaveInput = new SaveInput();
    branch.baselineRevision = 3;
    branch.localRevision = 5;
    branch.remoteRevision = 6;
    save.push(uiText("shortcut_text_0538", [String(saveAdvice(decideSave(branch)))]));
    const stale: SaveInput = new SaveInput();
    stale.baselineRevision = 3;
    stale.localRevision = 3;
    stale.remoteRevision = 5;
    save.push(uiText("shortcut_text_0227", [String(saveAdvice(decideSave(stale)))]));
    save.push(uiText("shortcut_text_0048", [String(saveLines().length)]));
    this.noteSaveLinesState = save;

    const bin: TrashBin = new TrashBin();
    bin.trash('note-1', '学习记录', 3, now - 86400000, '手动删除');
    bin.trash('note-2', '旧草稿', 1, now - 40 * 86400000, '覆盖');
    const trash: string[] = trashLines(bin, now);
    trash.push(uiText("shortcut_text_0355", [String(bin.restore('note-1', now) ? uiText("shortcut_text_0657") : uiText("shortcut_text_0132"))]));
    trash.push(uiText("shortcut_text_0259", [String(bin.restore('note-2', now) ? uiText("shortcut_text_0657") : uiText("shortcut_text_0656"))]));
    this.trashLinesState = trash;

    const todos: TodoDue[] = [];
    const overdue: TodoDue = new TodoDue(now - 3 * 86400000, Priority.HIGH);
    overdue.repeat = RepeatKind.WEEKLY;
    todos.push(overdue);
    const soon: TodoDue = new TodoDue(now + 3600000, Priority.NORMAL);
    todos.push(soon);
    const undated: TodoDue = new TodoDue(0, Priority.LOW);
    todos.push(undated);
    const due: string[] = [dueSummary(todos, now)];
    due.push(uiText("shortcut_text_0708", [String(overdueDays(overdue, now))]));
    due.push(uiText("shortcut_text_0245", [String(Priority.HIGH as string)]));
    const next: number = nextOccurrence(overdue, now);
    due.push(next <= 0 ? uiText("shortcut_text_0767") : uiText("shortcut_text_0766", [String(next)]));
    due.push(uiText("shortcut_text_0213", [String(dueLines().length)]));
    this.dueBucketLinesState = due;

    const docs: IndexedDoc[] = [];
    const first: IndexedDoc = new IndexedDoc('note-1', '接续学习记录');
    first.tags = normalizeTags(['#工作', 'work', '任务']);
    first.body = '记录一次完整的接续过程';
    docs.push(first);
    const second: IndexedDoc = new IndexedDoc('note-2', '待办清单');
    second.tags = normalizeTags(['待办', '学习']);
    second.body = '整理今日待办与收藏';
    docs.push(second);
    const index: TagIndex = new TagIndex();
    index.build(docs);
    const tag: string[] = [];
    tag.push(uiText("shortcut_text_0105", [String(index.size()), String(index.topTags()[0])]));
    tag.push(uiText("shortcut_text_0318", [String(tagSearch(docs, '工作').length)]));
    tagSearchLines(tagSearch(docs, '待办')).forEach((line: string): void => {
      tag.push(line);
    });
    tag.push(uiText("shortcut_text_0100", [String(tagLines().length)]));
    this.tagSearchLinesState = tag;
  }

  private rebuild(): void {
    const routes: string[] = routeLines();
    routes.push(auditRoutes().summary());
    const request: RouteRequest = new RouteRequest('sc.note.new', 0);
    request.put('focus', 'true');
    request.loggedIn = true;
    routes.push(uiText("shortcut_text_0515", [String(request.text())]));
    routes.push(uiText("shortcut_text_0332", [String(resolveRoute(request).text())]));
    routes.push(uiText("shortcut_text_0088", [String(routesOfPage(RoutePage.NOTE).join(','))]));
    routes.push(uiText("shortcut_text_0588", [String(routesOfPage(RoutePage.HOME).join(',') || uiText("shortcut_text_0529"))]));
    this.routeLinesState = routes;

    const todos: string[] = todoRuleLines();
    todos.push(auditTodoRules().summary());
    summarizeTodos(this.sampleTodos(), Date.now()).forEach((line: string): void => {
      todos.push(line);
    });
    this.todoLinesState = todos;

    const docs: SearchDoc[] = this.sampleDocs();
    const lines: string[] = [auditDocs(docs).summary()];
    lines.push(tokenSummary('便签 note'));
    search(docs, '便签 note', Date.now(), 5).forEach((hit): void => {
      lines.push(hit.text());
    });
    lines.push(uiText("shortcut_text_0246", [String(highlight('便签 note 检索示例', uniqueTokens('便签 note')))]));
    lines.push(uiText("shortcut_text_0364", [String(search(docs, '', Date.now(), 5).length)]));
    this.searchLinesState = lines;

    const now: number = 1700000000000;
    const items: CollectionItem[] = sampleCollections(now);
    const plan = govern(items, now);
    const collectionLines: string[] = [plan.text()];
    ruleLines().forEach((line: string): void => {
      collectionLines.push(line);
    });
    plan.lines().forEach((line: string): void => {
      collectionLines.push(line);
    });
    collectionLines.push(uiText("shortcut_text_0322", [String(pinQuota(items, 1).length)]));
    collectionLines.push(auditCollectionRules().summary());
    collectionLines.push(uiText("shortcut_text_0760", [String(plan.countOf(CollectionAction.PIN))]));
    this.collectionLinesState = collectionLines;

    const targets: FilterTarget[] = sampleTargets();
    const filterLines: string[] = [];
    chainNames().forEach((name: string): void => {
      filterLines.push(uiText("shortcut_text_0019", [String(name), String(PRESET_CHAINS.length)]));
    });
    chainLines().forEach((line: string): void => {
      filterLines.push(line);
    });
    chainCounts(targets).forEach((count: number, index: number): void => {
      filterLines.push(uiText("shortcut_text_0015", [String(PRESET_CHAINS[index].name), String(count)]));
    });
    const merged: FilterChain = mergeChains(PRESET_CHAINS[1], PRESET_CHAINS[4]);
    filterLines.push(uiText("shortcut_text_0266", [String(merged.name), String(merged.size())]));
    filterLines.push(auditChains().summary());
    this.filterLinesState = filterLines;

    const launchLines: string[] = [];
    sourceLines().forEach((line: string): void => {
      launchLines.push(line);
    });
    entryRuleLines().forEach((line: string): void => {
      launchLines.push(line);
    });
    const parsed = parseUri('app://detail?noteId=note-1');
    parsed.source = EntrySource.DEEPLINK;
    parsed.loggedIn = true;
    const entryPlan = resolveEntry(parsed);
    launchLines.push(uiText("shortcut_text_0333", [String(parsed.text())]));
    launchLines.push(uiText("shortcut_text_0327", [String(entryPlan.text())]));
    const missing = new EntryRequest(EntrySource.SHORTCUT, 'shortcut://detail');
    launchLines.push(uiText("shortcut_text_0467", [String(resolveEntry(missing).text())]));
    launchLines.push(uiText("shortcut_text_0585", [String(resolveEntry(new EntryRequest(EntrySource.UNKNOWN, 'x://y')).text())]));
    launchLines.push(auditEntry().summary());
    this.entryLinesState = launchLines;
    this.rebuildNoteRules(Date.now());
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 12 }) {
      Button({ type: ButtonType.Normal }) {
        Row({ space: 12 }) {
          Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor(TEXT).layoutWeight(1)
          Text(this.expandedTitles.includes(title) ? uiText("shortcut_text_0525") : uiText("shortcut_text_0147")).fontSize(14).fontColor(ACCENT)
        }.width('100%')
      }.width('100%').height(44).padding(0).backgroundColor(Color.Transparent)
        .onClick(() => {
          this.expandedTitles = this.expandedTitles.includes(title) ?
            this.expandedTitles.filter((value: string) => value !== title) : this.expandedTitles.concat([title]);
        })
      if (this.expandedTitles.includes(title)) {
        ForEach(lines, (line: string) => {
          Text(line).fontSize(14).fontColor(MUTED).width('100%')
        }, (line: string) => line)
      }
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(CARD)
    .borderRadius(16)
  }

  build() {
    Scroll() {
      Column({ space: 14 }) {
        Row({ space: 12 }) {
          Button(uiText("shortcut_text_0006"), { type: ButtonType.Normal }).height(44)
            .fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
            .padding({ left: 0, right: 8 }).onClick(() => router.back())
          Text(uiText("shortcut_text_0257")).fontSize(26).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        }.width('100%')

        this.card(uiText("shortcut_text_0370"), this.routeLinesState)
        this.card(uiText("shortcut_text_0193"), this.todoLinesState)
        this.card(uiText("shortcut_text_0065"), this.searchLinesState)
        this.card(uiText("shortcut_text_0522"), this.collectionLinesState)
        this.card(uiText("shortcut_text_0492"), this.filterLinesState)
        this.card(uiText("shortcut_text_0490"), this.entryLinesState)
      this.card(uiText("shortcut_text_0070"), this.noteSaveLinesState)
      this.card(uiText("shortcut_text_0298"), this.trashLinesState)
      this.card(uiText("shortcut_text_0192"), this.dueBucketLinesState)
      this.card(uiText("shortcut_text_0110"), this.tagSearchLinesState)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 20, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .backgroundColor(BG)
    .scrollBar(BarState.Auto)
  }
}
