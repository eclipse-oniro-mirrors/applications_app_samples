/**
 * ListModels 组合列表与标题栏业务模型
 *
 * - ContactItem/ContactStore：联系人数据仓库（增删、搜索、转 V1/V2 列表项配置）
 * - ListConfigFactory：ComposeListItem/V2、ComposeTitleBar/V2 配置工厂（统一构建入口）
 *
 * 纯逻辑无 UI 依赖（仅配置工厂引用 kit 类型），全部可单元测试。
 */
import { LogUtil } from './utils/LogUtil';
import {
  ContentItem, OperateItem, OperateIcon, OperateCheck, OperateButton, IconType,
  ContentItemV2, OperateItemV2, OperateIconV2, OperateCheckV2, OperateButtonV2, IconTypeV2,
  ComposeTitleBarMenuItem, ComposeTitleBarV2MenuItem
} from '@kit.ArkUI';

const TAG = 'ListModels';

/** 联系人数据模型 */
export interface ContactItem {
  id: number;
  name: string;
  phone: string;
  dept: string;
  online: boolean;
}

/** 联系人仓库：通讯录场景数据层（增删/搜索/在线状态切换） */
export class ContactStore {
  private contacts: ContactItem[] = [];
  private nextId: number = 1;

  /** 新增联系人，返回新条目 */
  add(name: string, phone: string, dept: string, online: boolean = false): ContactItem {
    const c: ContactItem = {
      id: this.nextId,
      name: name,
      phone: phone,
      dept: dept,
      online: online
    } as ContactItem;
    this.nextId++;
    this.contacts.push(c);
    LogUtil.info(TAG, `ContactStore.add：#${c.id}「${name}」${dept}，当前 ${this.contacts.length} 人`);
    return c;
  }

  /** 按 id 删除，返回是否成功 */
  remove(id: number): boolean {
    const before: number = this.contacts.length;
    this.contacts = this.contacts.filter((c: ContactItem): boolean => c.id !== id);
    const ok: boolean = this.contacts.length < before;
    if (ok) {
      LogUtil.info(TAG, `ContactStore.remove：#${id} 已删除，剩余 ${this.contacts.length} 人`);
    } else {
      LogUtil.warn(TAG, `ContactStore.remove：#${id} 不存在`);
    }
    return ok;
  }

  /** 切换在线状态，返回切换后的状态；id 不存在返回 null */
  toggleOnline(id: number): boolean | null {
    for (const c of this.contacts) {
      if (c.id === id) {
        c.online = !c.online;
        LogUtil.info(TAG, `ContactStore.toggleOnline：#${id}「${c.name}」→ ${c.online ? '在线' : '离线'}`);
        return c.online;
      }
    }
    LogUtil.warn(TAG, `ContactStore.toggleOnline：#${id} 不存在`);
    return null;
  }

  /** 全部联系人（副本） */
  getAll(): ContactItem[] {
    return this.contacts.slice();
  }

  /** 按 id 查找，未命中返回 null */
  findById(id: number): ContactItem | null {
    for (const c of this.contacts) {
      if (c.id === id) {
        return c;
      }
    }
    return null;
  }

  /** 按姓名/部门模糊搜索（大小写不敏感），空关键字返回全部 */
  search(keyword: string): ContactItem[] {
    if (keyword === '') {
      return this.getAll();
    }
    const kw: string = keyword.toLowerCase();
    const result: ContactItem[] = this.contacts.filter((c: ContactItem): boolean =>
      c.name.toLowerCase().includes(kw) || c.dept.toLowerCase().includes(kw));
    LogUtil.info(TAG, `ContactStore.search：「${keyword}」命中 ${result.length} 人`);
    return result;
  }

  /** 联系人数量 */
  count(): number {
    return this.contacts.length;
  }

  /** 在线人数 */
  onlineCount(): number {
    let n = 0;
    for (const c of this.contacts) {
      if (c.online) {
        n++;
      }
    }
    return n;
  }

  /** 清空 */
  clear(): void {
    this.contacts = [];
    LogUtil.info(TAG, 'ContactStore.clear：已清空');
  }
}

/** 配置工厂：统一构建 ComposeListItem/V2、ComposeTitleBar/V2 配置对象 */
export class ListConfigFactory {
  // ---------- ComposeListItem V1（class，字面量 as 断言） ----------

  /** V1 内容区：头像/图标 + 主文本 + 副文本 */
  static buildV1ContentItem(icon: ResourceStr, iconStyle: IconType, primary: string, secondary: string): ContentItem {
    return {
      icon: icon,
      iconStyle: iconStyle,
      primaryText: primary,
      secondaryText: secondary
    } as ContentItem;
  }

  /** V1 内容区（三行文本：主文本 + 副文本 + 描述） */
  static buildV1ContentItemWithDesc(icon: ResourceStr, iconStyle: IconType, primary: string,
    secondary: string, description: string): ContentItem {
    return {
      icon: icon,
      iconStyle: iconStyle,
      primaryText: primary,
      secondaryText: secondary,
      description: description
    } as ContentItem;
  }

  /** V1 右侧箭头操作区 */
  static buildV1OperateArrow(action: () => void): OperateItem {
    return {
      arrow: {
        value: $r('sys.media.ohos_ic_public_arrow_right'),
        action: action
      } as OperateIcon
    } as OperateItem;
  }

  /** V1 右侧开关操作区 */
  static buildV1OperateSwitch(isCheck: boolean, onChange: (v: boolean) => void): OperateItem {
    return {
      switch: {
        isCheck: isCheck,
        onChange: onChange
      } as OperateCheck
    } as OperateItem;
  }

  /** V1 右侧按钮操作区 */
  static buildV1OperateButton(text: string): OperateItem {
    return {
      button: {
        text: text
      } as OperateButton
    } as OperateItem;
  }

  /** V1 右侧复选框操作区 */
  static buildV1OperateCheckbox(isCheck: boolean, onChange: (v: boolean) => void): OperateItem {
    return {
      checkbox: {
        isCheck: isCheck,
        onChange: onChange
      } as OperateCheck
    } as OperateItem;
  }

  /** V1 右侧单选按钮操作区 */
  static buildV1OperateRadio(isCheck: boolean, onChange: (v: boolean) => void): OperateItem {
    return {
      radio: {
        isCheck: isCheck,
        onChange: onChange
      } as OperateCheck
    } as OperateItem;
  }

  /** V1 右侧图片操作区 */
  static buildV1OperateImage(image: ResourceStr): OperateItem {
    return {
      image: image
    } as OperateItem;
  }

  /** V1 右侧文本操作区 */
  static buildV1OperateText(text: string): OperateItem {
    return {
      text: text
    } as OperateItem;
  }

  /** V1 右侧双图标操作区（icon + subIcon，如收藏+分享） */
  static buildV1OperateDoubleIcon(action1: () => void, action2: () => void): OperateItem {
    return {
      icon: {
        value: $r('app.media.startIcon'),
        action: action1
      } as OperateIcon,
      subIcon: {
        value: $r('app.media.startIcon'),
        action: action2
      } as OperateIcon
    } as OperateItem;
  }

  /** V1 标题栏菜单项 */
  static buildV1MenuItem(value: string, action: () => void): ComposeTitleBarMenuItem {
    return {
      value: value,
      action: action
    } as ComposeTitleBarMenuItem;
  }

  // ---------- ComposeListItem V2（class，constructor(options)） ----------

  /** V2 内容区 */
  static buildV2ContentItem(icon: ResourceStr, iconStyle: IconTypeV2, primary: string, secondary: string): ContentItemV2 {
    return new ContentItemV2({
      icon: icon,
      iconStyle: iconStyle,
      primaryText: primary,
      secondaryText: secondary
    });
  }

  /** V2 内容区（三行文本） */
  static buildV2ContentItemWithDesc(icon: ResourceStr, iconStyle: IconTypeV2, primary: string,
    secondary: string, description: string): ContentItemV2 {
    return new ContentItemV2({
      icon: icon,
      iconStyle: iconStyle,
      primaryText: primary,
      secondaryText: secondary,
      description: description
    });
  }

  /** V2 右侧开关操作区（V2 字段名为 toggle，V1 为 switch） */
  static buildV2OperateToggle(isCheck: boolean, onChange: (v: boolean) => void): OperateItemV2 {
    return new OperateItemV2({
      toggle: new OperateCheckV2({
        isCheck: isCheck,
        onChange: onChange
      })
    });
  }

  /** V2 右侧按钮操作区 */
  static buildV2OperateButton(text: string): OperateItemV2 {
    return new OperateItemV2({
      button: new OperateButtonV2({
        text: text
      })
    });
  }

  /** V2 右侧复选框操作区 */
  static buildV2OperateCheckbox(isCheck: boolean, onChange: (v: boolean) => void): OperateItemV2 {
    return new OperateItemV2({
      checkbox: new OperateCheckV2({
        isCheck: isCheck,
        onChange: onChange
      })
    });
  }

  /** V2 右侧单选按钮操作区 */
  static buildV2OperateRadio(isCheck: boolean, onChange: (v: boolean) => void): OperateItemV2 {
    return new OperateItemV2({
      radio: new OperateCheckV2({
        isCheck: isCheck,
        onChange: onChange
      })
    });
  }

  /** V2 右侧图片操作区 */
  static buildV2OperateImage(image: ResourceStr): OperateItemV2 {
    return new OperateItemV2({
      image: image
    });
  }

  /** V2 右侧文本操作区 */
  static buildV2OperateText(text: string): OperateItemV2 {
    return new OperateItemV2({
      text: text
    });
  }

  /** V2 右侧双图标操作区（icon + subIcon） */
  static buildV2OperateDoubleIcon(action1: () => void, action2: () => void): OperateItemV2 {
    return new OperateItemV2({
      icon: new OperateIconV2({
        value: $r('app.media.startIcon'),
        action: action1
      }),
      subIcon: new OperateIconV2({
        value: $r('app.media.startIcon'),
        action: action2
      })
    });
  }

  /** V2 右侧箭头操作区 */
  static buildV2OperateArrow(action: () => void): OperateItemV2 {
    return new OperateItemV2({
      arrow: new OperateIconV2({
        value: $r('sys.media.ohos_ic_public_arrow_right'),
        action: action
      })
    });
  }

  /** V2 标题栏菜单项 */
  static buildV2MenuItem(value: string, action: () => void): ComposeTitleBarV2MenuItem {
    return new ComposeTitleBarV2MenuItem({
      value: value,
      action: action
    });
  }
}
