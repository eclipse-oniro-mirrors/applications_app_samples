export enum SheetStyle {
  CENTER = 0,
  POPUP = 1
}

export function sheetModeName(mode: SheetStyle): string {
  return mode === SheetStyle.POPUP ? 'POPUP 弹窗样式' : 'CENTER 居中样式';
}

export function toggleSheetStyle(mode: SheetStyle): SheetStyle {
  return mode === SheetStyle.POPUP ? SheetStyle.CENTER : SheetStyle.POPUP;
}

export function canOpenSheet(visible: boolean): boolean {
  return !visible;
}

export function heightBucket(heightVp: number): number {
  if (heightVp <= 0) {
    return 0;
  }
  if (heightVp < 300) {
    return 1;
  }
  if (heightVp < 600) {
    return 2;
  }
  return 3;
}

export function heightBucketLabel(bucket: number): string {
  switch (bucket) {
    case 1:
      return '低档（< 300vp）';
    case 2:
      return '中档（300–600vp）';
    case 3:
      return '高档（≥ 600vp）';
    default:
      return '尚未打开';
  }
}

export function sheetStatusText(visible: boolean, mode: SheetStyle, heightVp: number): string {
  const state = visible ? '已打开' : '已关闭';
  return `${state} · ${sheetModeName(mode)} · ${heightBucketLabel(heightBucket(heightVp))}`;
}
