export class DemoItem {
  key: string;
  title: string;
  subtitle: string;
  category: string;

  constructor(key: string, title: string, subtitle: string, category: string) {
    this.key = key;
    this.title = title;
    this.subtitle = subtitle;
    this.category = category;
  }
}

export const DEMO_ITEMS: DemoItem[] = [
  new DemoItem('navigation', 'AtomicServiceNavigation', '页面根容器：标题栏、内容区、NavDestination 路由', '容器'),
  new DemoItem('search', 'AtomicServiceSearch', '搜索区 + 选择区 + 两个功能区', '交互'),
  new DemoItem('tabs', 'AtomicServiceTabs', '最多 5 个页签的简化 Tabs', '交互'),
  new DemoItem('web', 'AtomicServiceWeb', '本地 H5 页面 + 控制器 + 消息通信', '能力'),
  new DemoItem('download', 'DownloadFileButton', '统一样式的下载按钮 + 文档保存', '能力'),
  new DemoItem('halfScreen', 'HalfScreenLaunchComponent', '半屏嵌入拉起原子化服务（占位 appId 打桩）', '能力')
];

export const CATEGORIES: string[] = ['全部', '容器', '交互', '能力'];

export function filterDemos(items: DemoItem[], keyword: string, category: string): DemoItem[] {
  const normalized = keyword.trim().toLowerCase();
  return items.filter((item: DemoItem) => {
    const categoryMatched = category === '' || category === '全部' || item.category === category;
    const keywordMatched = normalized === '' ||
      item.title.toLowerCase().includes(normalized) ||
      item.subtitle.toLowerCase().includes(normalized) ||
      item.category.toLowerCase().includes(normalized);
    return categoryMatched && keywordMatched;
  });
}

export function canSwitchTab(currentIndex: number, comingIndex: number, locked: boolean, tabCount: number): boolean {
  if (tabCount <= 0 || comingIndex < 0 || comingIndex >= tabCount) {
    return false;
  }
  return !locked || currentIndex === comingIndex;
}

export function canPopNavStack(size: number): boolean {
  return size > 0;
}
