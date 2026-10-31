/**
 * DialogModels 弹窗演示模型层
 *
 * 纯逻辑封装，不依赖 UIContext，可被 ohosTest 设备测试覆盖：
 *  - DialogEventLog：弹窗生命周期事件簿记（打开/关闭/选中/勾选/错误），静态 format* 生成统一格式行
 *  - buildPrimaryButton / buildSecondaryButton：AdvancedDialogV2Button 默认样式封装
 *  - buildSheetInfos：SelectDialogV2 单选数据构造
 *  - InterstitialConfig：InterstitialDialogAction 的 DialogOptions 描述（UIContext 由页面注入）
 *  - ConfirmParams 等参数类：ComponentContent builder 载荷
 */
import { AdvancedDialogV2Button, AdvancedDialogV2ButtonOptions } from '@kit.ArkUI';
import { IconStyle, TitlePosition, BottomOffset } from '@kit.ArkUI';

/** 事件日志容量上限 */
const LOG_CAP: number = 60;

export class DialogEventLog {
  private events: string[] = [];

  /** 打开事件行 */
  static formatOpen(sceneId: number, name: string): string {
    return `open#${sceneId} ${name}`;
  }

  /** 关闭事件行 */
  static formatClose(sceneId: number, name: string): string {
    return `close#${sceneId} ${name}`;
  }

  /** 单选选中行 */
  static formatSelect(sceneId: number, index: number): string {
    return `select#${sceneId} index=${index}`;
  }

  /** 复选框勾选行 */
  static formatCheck(sceneId: number, checked: boolean): string {
    return `check#${sceneId} checked=${checked}`;
  }

  /** 点击弹窗主体行 */
  static formatClick(sceneId: number): string {
    return `click#${sceneId}`;
  }

  /** 错误行 */
  static formatError(sceneId: number, message: string): string {
    return `error#${sceneId} ${message}`;
  }

  /** 记录一行事件（超出容量丢弃最旧） */
  record(line: string): void {
    this.events.push(line);
    if (this.events.length > LOG_CAP) {
      this.events.shift();
    }
  }

  /** 全部事件行快照（副本） */
  toLines(): string[] {
    return this.events.slice(0);
  }

  /** 最近一行；无事件返回空串 */
  last(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  /** 是否包含指定前缀的记录（如 'open#1'） */
  hasPrefix(prefix: string): boolean {
    for (const e of this.events) {
      if (e.startsWith(prefix)) {
        return true;
      }
    }
    return false;
  }

  count(): number {
    return this.events.length;
  }

  clear(): void {
    this.events = [];
  }
}

/** 主按钮：EMPHASIZED 强调样式 */
export function buildPrimaryButton(content: string,
  action?: () => void): AdvancedDialogV2Button {
  const options: AdvancedDialogV2ButtonOptions = {
    content: content,
    action: action,
    buttonStyle: ButtonStyleMode.EMPHASIZED
  };
  return new AdvancedDialogV2Button(options);
}

/** 次按钮：TEXTUAL 文本样式 */
export function buildSecondaryButton(content: string,
  action?: () => void): AdvancedDialogV2Button {
  const options: AdvancedDialogV2ButtonOptions = {
    content: content,
    action: action,
    buttonStyle: ButtonStyleMode.TEXTUAL
  };
  return new AdvancedDialogV2Button(options);
}

/** SelectDialogV2 单选数据：action 经下标闭包回传选中项 */
export function buildSheetInfos(labels: string[], onPick: (index: number) => void): SheetInfo[] {
  const sheets: SheetInfo[] = [];
  for (let i = 0; i < labels.length; i++) {
    const idx: number = i;
    const info: SheetInfo = {
      title: labels[i],
      action: (): void => {
        onPick(idx);
      }
    };
    sheets.push(info);
  }
  return sheets;
}

/** 插屏弹窗配置描述（不含 UIContext，页面组装 DialogOptions 时注入） */
export class InterstitialConfig {
  title: string;
  subtitle: string;
  titlePosition: TitlePosition;
  iconStyle: IconStyle;
  bottomOffsetType: BottomOffset;

  constructor(title: string, subtitle: string, titlePosition: TitlePosition,
    iconStyle: IconStyle, bottomOffsetType: BottomOffset) {
    this.title = title;
    this.subtitle = subtitle;
    this.titlePosition = titlePosition;
    this.iconStyle = iconStyle;
    this.bottomOffsetType = bottomOffsetType;
  }
}

/** 场景1 ConfirmDialogV2 载荷 */
export class ConfirmParams {
  sceneId: number = 1;
  title: string = '';
  content: string = '';
  checkTips: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景2 AlertDialogV2 载荷 */
export class AlertParams {
  sceneId: number = 2;
  primaryTitle: string = '';
  secondaryTitle: string = '';
  content: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景3 SelectDialogV2 载荷 */
export class SelectParams {
  sceneId: number = 3;
  title: string = '';
  content: string = '';
  selectedIndex: number = 0;
  radioContent: SheetInfo[] = [];
  confirm: AdvancedDialogV2Button | null = null;
}

/** 场景4 TipsDialogV2 载荷 */
export class TipsParams {
  sceneId: number = 4;
  imageRes: ResourceStr = $r('app.media.startIcon');
  title: string = '';
  content: string = '';
  checkTips: string = '';
  primaryButton: AdvancedDialogV2Button | null = null;
  secondaryButton: AdvancedDialogV2Button | null = null;
}

/** 场景5 LoadingDialogV2 载荷 */
export class LoadingParams {
  sceneId: number = 5;
  content: string = '';
}

/** 场景6 CustomContentDialogV2 载荷 */
export class CustomParams {
  sceneId: number = 6;
  primaryTitle: string = '';
  secondaryTitle: string = '';
  buttons: AdvancedDialogV2Button[] = [];
}
