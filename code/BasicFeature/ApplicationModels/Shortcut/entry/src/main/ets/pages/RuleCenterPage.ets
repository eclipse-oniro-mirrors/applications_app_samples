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
  IntentRequest, IntentSource, auditIntent, parseUri, resolveIntent, ruleLines as intentRuleLines,
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
  @State private intentLinesState: string[] = [];

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
    save.push(`只有本机前进：${saveAdvice(decideSave(clean))}`);
    const branch: SaveInput = new SaveInput();
    branch.baselineRevision = 3;
    branch.localRevision = 5;
    branch.remoteRevision = 6;
    save.push(`双方都改：${saveAdvice(decideSave(branch))}`);
    const stale: SaveInput = new SaveInput();
    stale.baselineRevision = 3;
    stale.localRevision = 3;
    stale.remoteRevision = 5;
    save.push(`对端更新：${saveAdvice(decideSave(stale))}`);
    save.push(`保存规则 ${saveLines().length} 条`);
    this.noteSaveLinesState = save;

    const bin: TrashBin = new TrashBin();
    bin.trash('note-1', '学习记录', 3, now - 86400000, '手动删除');
    bin.trash('note-2', '旧草稿', 1, now - 40 * 86400000, '覆盖');
    const trash: string[] = trashLines(bin, now);
    trash.push(`可恢复：${bin.restore('note-1', now) ? '已恢复' : '不可恢复'}`);
    trash.push(`过期恢复：${bin.restore('note-2', now) ? '已恢复' : '已过期，不允许恢复'}`);
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
    due.push(`逾期天数：${overdueDays(overdue, now)}`);
    due.push(`高价优先排序权重：${Priority.HIGH as string}`);
    const next: number = nextOccurrence(overdue, now);
    due.push(next <= 0 ? '重复任务下次未定' : `重复任务下次：${next}`);
    due.push(`到期规则 ${dueLines().length} 条`);
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
    tag.push(`标签索引 ${index.size()} 个，首个 ${index.topTags()[0]}`);
    tag.push(`检索“工作”命中 ${tagSearch(docs, '工作').length} 条`);
    tagSearchLines(tagSearch(docs, '待办')).forEach((line: string): void => {
      tag.push(line);
    });
    tag.push(`标签检索规则 ${tagLines().length} 条`);
    this.tagSearchLinesState = tag;
  }

  private rebuild(): void {
    const routes: string[] = routeLines();
    routes.push(auditRoutes().summary());
    const request: RouteRequest = new RouteRequest('sc.note.new', 0);
    request.put('focus', 'true');
    request.loggedIn = true;
    routes.push(`示例入口：${request.text()}`);
    routes.push(`解析结果：${resolveRoute(request).text()}`);
    routes.push(`便签页入口：${routesOfPage(RoutePage.NOTE).join(',')}`);
    routes.push(`未知路由落到：${routesOfPage(RoutePage.HOME).join(',') || '首页'}`);
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
    lines.push(`高亮示例：${highlight('便签 note 检索示例', uniqueTokens('便签 note'))}`);
    lines.push(`空查询命中：${search(docs, '', Date.now(), 5).length} 条`);
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
    collectionLines.push(`建议取消置顶：${pinQuota(items, 1).length} 条`);
    collectionLines.push(auditCollectionRules().summary());
    collectionLines.push(`置顶动作 ${plan.countOf(CollectionAction.PIN)} 条`);
    this.collectionLinesState = collectionLines;

    const targets: FilterTarget[] = sampleTargets();
    const filterLines: string[] = [];
    chainNames().forEach((name: string): void => {
      filterLines.push(`${name}：${PRESET_CHAINS.length} 条预设`);
    });
    chainLines().forEach((line: string): void => {
      filterLines.push(line);
    });
    chainCounts(targets).forEach((count: number, index: number): void => {
      filterLines.push(`${PRESET_CHAINS[index].name} 命中 ${count} 条`);
    });
    const merged: FilterChain = mergeChains(PRESET_CHAINS[1], PRESET_CHAINS[4]);
    filterLines.push(`合并链：${merged.name}｜${merged.size()} 个节点`);
    filterLines.push(auditChains().summary());
    this.filterLinesState = filterLines;

    const launchLines: string[] = [];
    sourceLines().forEach((line: string): void => {
      launchLines.push(line);
    });
    intentRuleLines().forEach((line: string): void => {
      launchLines.push(line);
    });
    const parsed = parseUri('app://detail?noteId=note-1');
    parsed.source = IntentSource.DEEPLINK;
    parsed.loggedIn = true;
    const intentPlan = resolveIntent(parsed);
    launchLines.push(`解析示例：${parsed.text()}`);
    launchLines.push(`结果：${intentPlan.text()}`);
    const missing = new IntentRequest(IntentSource.SHORTCUT, 'shortcut://detail');
    launchLines.push(`缺参数：${resolveIntent(missing).text()}`);
    launchLines.push(`未知来源：${resolveIntent(new IntentRequest(IntentSource.UNKNOWN, 'x://y')).text()}`);
    launchLines.push(auditIntent().summary());
    this.intentLinesState = launchLines;
    this.rebuildNoteRules(Date.now());
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 12 }) {
      Button({ type: ButtonType.Normal }) {
        Row({ space: 12 }) {
          Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor(TEXT).layoutWeight(1)
          Text(this.expandedTitles.includes(title) ? '收起' : '查看').fontSize(14).fontColor(ACCENT)
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
          Button('‹ 返回', { type: ButtonType.Normal }).height(44)
            .fontSize(14).fontColor(ACCENT).backgroundColor(Color.Transparent)
            .padding({ left: 0, right: 8 }).onClick(() => router.back())
          Text('规则中心').fontSize(26).fontWeight(FontWeight.Bold).fontColor(TEXT).layoutWeight(1)
        }.width('100%')

        this.card('快捷入口路由', this.routeLinesState)
        this.card('待办规则', this.todoLinesState)
        this.card('本地检索', this.searchLinesState)
        this.card('收藏治理', this.collectionLinesState)
        this.card('筛选链', this.filterLinesState)
        this.card('入口意图', this.intentLinesState)
      this.card('笔记保存基线', this.noteSaveLinesState)
      this.card('回收站', this.trashLinesState)
      this.card('待办到期与重复', this.dueBucketLinesState)
      this.card('标签与检索', this.tagSearchLinesState)
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
