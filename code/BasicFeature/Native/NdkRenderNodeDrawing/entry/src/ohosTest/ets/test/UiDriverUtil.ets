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

import { i18n } from '@kit.LocalizationKit';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

// 多个测试套件共用的驱动封装，避免在每个套件里重复实现查找与点击逻辑。
export const DOMAIN: number = 0xF811;
export const BUNDLE: string = 'com.samples.ndknodedrawing';
export const ABILITY: string = 'EntryAbility';
export const INDEX_TITLE: string = 'RenderNode Drawing';
export const BACK_BUTTON: string = 'Back';
export const WAIT_TIMEOUT: number = 15000;
export const UI_SETTLE_TIME: number = 1000;
export const CLICK_SETTLE_TIME: number = 800;
// 页面与控件 id：由页面代码统一生成，用例据此定位，不再依赖界面文案。
// 能力域与专题页的控件 id 均带 schema 的 group.key 后缀，保持全模块唯一。
export const ID_INDEX_TITLE: string = 'index_title';
export const ID_CATALOG_PAGE_TITLE: string = 'catalog_page_title';
export const ID_TOPIC_CATALOG_PAGE_TITLE: string = 'topic_catalog_page_title';
export const ID_CATALOG_PAGE_DESC: string = 'catalog_page_desc';
export const ID_TOPIC_CATALOG_PAGE_DESC: string = 'topic_catalog_page_desc';
export const ID_NAV_BACK_CATALOG: string = 'nav_back_catalog';
export const ID_NAV_BACK_TOPIC_CATALOG: string = 'nav_back_topic_catalog';

// 独立演示页的 pageKey，与页面传给 DemoTitle / ScenePanel 的取值一致。
export const PAGE_EFFECT: string = 'effect';
export const PAGE_IMAGE: string = 'image';
export const PAGE_PRIMITIVE: string = 'primitive';
export const PAGE_TRANSFORM: string = 'transform';
export const PAGE_TEXT: string = 'text';
export const PAGE_RENDER_PROPERTY: string = 'render_property';
export const PAGE_DRAW: string = 'draw';
export const PAGE_BLUR: string = 'blur';
export const PAGE_NODE_TREE: string = 'node_tree';
export const PAGE_LIFECYCLE: string = 'lifecycle';

// 单实例页面的固定 id，页面内不会重复，因此不需要后缀。
export const ID_BLUR_CANVAS: string = 'blur_canvas';
export const ID_BLUR_MODE_BACKGROUND: string = 'blur_mode_background';
export const ID_BLUR_MODE_CONTENT: string = 'blur_mode_content';
export const ID_BLUR_MODE_FOREGROUND: string = 'blur_mode_foreground';
export const ID_BLUR_RESET: string = 'blur_reset';
export const ID_BLUR_RADIUS: string = 'blur_radius';
export const ID_DRAW_CANVAS: string = 'draw_canvas';
export const ID_DRAW_PATH: string = 'draw_path';
export const ID_DRAW_TEXT: string = 'draw_text';
export const ID_DRAW_IMAGE: string = 'draw_image';
export const ID_NODE_TREE_CANVAS: string = 'node_tree_canvas';
export const ID_NODE_TREE_ADD: string = 'node_tree_add';
export const ID_NODE_TREE_REMOVE: string = 'node_tree_remove';
export const ID_NODE_TREE_RESET: string = 'node_tree_reset';
export const ID_NODE_TREE_CHILD_COUNT: string = 'node_tree_child_count';
export const ID_LIFECYCLE_LABEL: string = 'lifecycle_label';
export const ID_LIFECYCLE_INVALIDATE: string = 'lifecycle_invalidate';
export const ID_LIFECYCLE_DISPOSE: string = 'lifecycle_dispose';
export const ID_LIFECYCLE_RECREATE: string = 'lifecycle_recreate';
export const ID_LIFECYCLE_DISPOSED: string = 'lifecycle_disposed';
export const ID_TEXT_MEASURE_BTN: string = 'text_measure_btn';
export const ID_TEXT_MEASURE_RESULT: string = 'text_measure_result';
export const ID_PROP_BACKGROUND_TOGGLE: string = 'prop_background_toggle';
export const ID_PROP_OPACITY_TOGGLE: string = 'prop_opacity_toggle';
export const ID_PROP_CLIP_TOGGLE: string = 'prop_clip_toggle';
export const ID_PROP_SHADOW_TOGGLE: string = 'prop_shadow_toggle';
export const ID_PROP_SCALE_TOGGLE: string = 'prop_scale_toggle';
export const ID_PROP_ROTATION_TOGGLE: string = 'prop_rotation_toggle';

// 首页列表项的入口 key，与 Index.ets 中的 DemoEntry.key 一致。
export const ENTRY_DRAW: string = 'draw';
export const ENTRY_CAPABILITY: string = 'capability';
export const ENTRY_TOPIC: string = 'topic';

export function indexItemId(key: string): string {
  return 'index_item_' + key;
}

export function indexItemTitleId(key: string): string {
  return 'index_item_title_' + key;
}

export function catalogItemId(groupKey: string): string {
  return 'catalog_item_' + groupKey;
}

export function catalogItemTitleId(groupKey: string): string {
  return 'catalog_item_title_' + groupKey;
}

export function catalogItemDescId(groupKey: string): string {
  return 'catalog_item_desc_' + groupKey;
}

export function catalogItemCountId(groupKey: string): string {
  return 'catalog_item_count_' + groupKey;
}

export function topicItemId(groupKey: string): string {
  return 'topic_catalog_item_' + groupKey;
}

export function topicItemTitleId(groupKey: string): string {
  return 'topic_catalog_item_title_' + groupKey;
}

export function topicItemDescId(groupKey: string): string {
  return 'topic_catalog_item_desc_' + groupKey;
}

export function topicItemCountId(groupKey: string): string {
  return 'topic_catalog_item_count_' + groupKey;
}

export function groupTitleId(groupKey: string): string {
  return 'group_title_' + groupKey;
}

export function groupDescId(groupKey: string): string {
  return 'group_desc_' + groupKey;
}

export function groupStatusId(groupKey: string): string {
  return 'group_status_' + groupKey;
}

export function sceneButtonId(groupKey: string, sceneId: number): string {
  return 'scene_btn_' + groupKey + '_' + sceneId.toString();
}

export function sceneDescId(groupKey: string, sceneId: number): string {
  return 'scene_desc_' + groupKey + '_' + sceneId.toString();
}

export function navBackId(groupKey: string): string {
  return 'nav_back_' + groupKey;
}

export function paramsTitleId(groupKey: string): string {
  return 'params_title_' + groupKey;
}

export function paramsResetId(groupKey: string): string {
  return 'params_reset_' + groupKey;
}

export function paramsReapplyId(groupKey: string): string {
  return 'params_reapply_' + groupKey;
}

// 能力域与专题页的 RenderNode 画布。
export function groupCanvasId(groupKey: string): string {
  return 'group_canvas_' + groupKey;
}

// 独立演示页的返回按钮与标题。
export function pageBackId(pageKey: string): string {
  return 'page_back_' + pageKey;
}

export function pageTitleId(pageKey: string): string {
  return 'page_title_' + pageKey;
}

// 独立演示页的 RenderNode 画布与场景按钮。
export function demoCanvasId(pageKey: string): string {
  return 'demo_canvas_' + pageKey;
}

export function demoSceneButtonId(pageKey: string, kind: number): string {
  return 'demo_scene_' + pageKey + '_' + kind.toString();
}

// 参数行：sceneKey 由宿主固定为 groupKey + '-' + sceneId，与 ParamPanel 内部的取值一致。
export function paramSceneKey(groupKey: string, sceneId: number): string {
  return groupKey + '-' + sceneId.toString();
}

export function paramRowId(sceneKey: string, index: number): string {
  return 'param_row_' + sceneKey + '_' + index.toString();
}

export function paramKeyId(sceneKey: string, index: number): string {
  return 'param_key_' + sceneKey + '_' + index.toString();
}

export function paramControlId(sceneKey: string, index: number): string {
  return 'param_control_' + sceneKey + '_' + index.toString();
}

export function paramValueId(sceneKey: string, index: number): string {
  return 'param_value_' + sceneKey + '_' + index.toString();
}
// 首页 → 能力矩阵 → 能力域页面最多三层，留一步余量。
const MAX_BACK_STEPS: number = 4;

const UTIL_TAG: string = '[Sample_NdkRenderNodeUtil]';
// 界面文案来自 $r 资源，用例统一按英文书写；中文设备上需换成对应译文再查询。
const ZH_TEXT: Map<string, string[]> = new Map<string, string[]>();

function addZhText(english: string, translations: string[]): void {
  ZH_TEXT.set(english, translations);
}

addZhText('RenderNode Drawing', ['RenderNode 绘制']);
addZhText('Canvas Drawing', ['画布绘制']);
addZhText('Primitives', ['几何图元']);
addZhText('Drawing Effects', ['绘制效果']);
addZhText('Canvas Transform', ['画布变换']);
addZhText('Image Drawing', ['图片绘制']);
addZhText('Text Drawing', ['文本绘制']);
addZhText('Node Tree', ['节点树']);
addZhText('Render Properties', ['渲染属性']);
addZhText('Blur Effects', ['模糊效果']);
addZhText('Lifecycle', ['生命周期']);
addZhText('Capability Matrix', ['能力矩阵']);
addZhText('RenderNode Topics', ['RenderNode 专题']);
addZhText('Back', ['返回']);
addZhText('Draw Path', ['绘制路径']);
addZhText('Draw Text', ['绘制文本']);
addZhText('Draw Image', ['绘制图片']);
addZhText('Measure Text', ['测量文本']);
addZhText('Add Child', ['添加子节点']);
addZhText('Remove Child', ['移除子节点']);
addZhText('Reset', ['重置']);
addZhText('Parameters', ['参数']);
addZhText('Re-apply', ['重新应用']);
addZhText('Background', ['背景色', '背景模糊']);
addZhText('Content', ['内容模糊']);
addZhText('Foreground', ['前景模糊']);
addZhText('Radius', ['模糊半径']);
addZhText('Opacity', ['透明度']);
addZhText('Clip', ['裁剪']);
addZhText('Shadow', ['阴影']);
addZhText('Scale', ['缩放']);
addZhText('Rotation', ['旋转']);
addZhText('Set Label', ['设置 label']);
addZhText('Invalidate', ['触发重绘']);
addZhText('Dispose', ['销毁节点']);
addZhText('Recreate', ['重建节点']);
addZhText('RenderNode + Native Drawing capability demos', ['RenderNode 与 Native Drawing 能力演示']);
addZhText('Draw path, text and image onto a RenderNode through Node-API.',
  ['通过 Node-API 在 RenderNode 上绘制路径、文本与图片。']);
addZhText('Point, line, circle, oval, rect, round rect, arc, path and region.',
  ['点、线、圆、椭圆、矩形、圆角矩形、圆弧、路径与区域。']);
addZhText('Fill and stroke, blend mode, dash, gradients, color filter and mask blur.',
  ['填充描边、混合模式、虚线、渐变、颜色滤波与蒙版模糊。']);
addZhText('Clip, translate, rotate, scale, matrix and save/restore.',
  ['裁剪、平移、旋转、缩放、矩阵变换与状态保存恢复。']);
addZhText('Draw a pixel map with different sampling modes and a scale view.',
  ['以不同采样模式绘制 PixelMap，并演示缩放视图。']);
addZhText('TextBlob, typography layout and text measurement.', ['TextBlob、Typography 排版与文本测量。']);
addZhText('Append and remove child render nodes at runtime.', ['在运行时添加与移除子渲染节点。']);
addZhText('Toggle background color, opacity, clip, shadow, scale and rotation.',
  ['切换背景色、透明度、裁剪、阴影、缩放与旋转。']);
addZhText('Background, content and foreground blur supported since API 26.',
  ['API 26 起支持背景模糊、内容模糊与前景模糊。']);
addZhText('Set label, invalidate, dispose and recreate the render node.',
  ['设置 label、触发重绘、销毁与重建渲染节点。']);
addZhText('Schema driven demos across 19 capability families: canvas, paint, bitmap, text, shadow, matrix, ' +
  'record, offscreen layer and error codes.',
  ['以 schema 驱动的演示，覆盖画布、画笔、位图、文字、阴影、矩阵、录制、表面与错误码等 19 个能力域。']);
addZhText('Ten node level topics: tree, properties, blur, animation, hit testing, performance, record, ' +
  'device fit, lifecycle and frame tick.',
  ['十个节点级专题：节点树、渲染属性、模糊、动画、命中测试、性能、录制回放、多设备适配、生命周期与帧回调。']);
// 两个目录页的自己的说明文案（catalog_desc / topic_catalog_desc），与首页入口的说明不是同一组资源，
// 中文设备上目录页只渲染译文，缺这两条映射时按英文查找会整层超时。
addZhText('Schema driven demos: each group renders every native drawing capability of one header family.',
  ['以 schema 驱动：每个分组演示同一原生绘制头文件族的全部能力。']);
addZhText('Node level topics: tree, properties, blur, animation, hit testing, performance, record and device fit.',
  ['节点级专题：节点树、渲染属性、模糊、动画、命中测试、性能、录制与多设备适配。']);

// 只有中文设备才需要替换；英文环境直接用用例里的原文。
const CHINESE_LOCALE: boolean = detectChineseLocale();

function detectChineseLocale(): boolean {
  try {
    const language: string = i18n.System.getSystemLanguage();
    return language.toLowerCase().indexOf('zh') === 0;
  } catch (error) {
    hilog.warn(DOMAIN, UTIL_TAG, 'getSystemLanguage failed, message=%{public}s',
      (error as Error).message);
    return false;
  }
}

export function textCandidates(text: string): string[] {
  if (!CHINESE_LOCALE) {
    return [text];
  }
  const translations: string[] | undefined = ZH_TEXT.get(text);
  if (translations === undefined) {
    return [text];
  }
  const candidates: string[] = [text];
  for (const translation of translations) {
    candidates.push(translation);
  }
  return candidates;
}

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export function logInfo(tag: string, message: string): void {
  hilog.info(DOMAIN, tag, '%{public}s', message);
}

// driver.delayMs 声明了可能抛出的异常，统一封装避免遗漏异常处理。
export async function delay(driver: Driver, duration: number): Promise<void> {
  try {
    await driver.delayMs(duration);
  } catch (error) {
    logInfo(UTIL_TAG, 'delayMs failed: ' + JSON.stringify(error));
  }
}

export async function launchAbility(tag: string): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    return true;
  } catch (error) {
    logInfo(tag, 'startAbility failed: ' + JSON.stringify(error));
    return false;
  }
}

// 设备侧命令超时，单位为秒；shell 与 power-shell 命令正常在百毫秒级返回。
const SHELL_TIMEOUT_SECS: number = 5;
// 设备侧命令兜底时间，单位为毫秒，避免命令未返回时把后续用例拖进超时。
export const SHELL_SETTLE_TIME: number = 500;

// 驱动尚未创建时的等待实现，设备前置准备阶段不能借助 Driver.delayMs。
function waitMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

// 执行一条设备侧命令，返回是否成功；任何异常都归一为 false，不打断用例。
export async function shellCommand(command: string, tag: string): Promise<boolean> {
  try {
    let exitCode: number = -1;
    await delegator.executeShellCommand(command, SHELL_TIMEOUT_SECS).then((result) => {
      exitCode = result.exitCode;
    }).catch((error: Error) => {
      logInfo(tag, 'shell [' + command + '] rejected: ' + JSON.stringify(error));
    });
    logInfo(tag, 'shell [' + command + '] exit=' + exitCode.toString());
    return exitCode === 0;
  } catch (error) {
    logInfo(tag, 'shell [' + command + '] failed: ' + JSON.stringify(error));
    return false;
  }
}

// 唤醒屏幕：息屏时 UiTest 只能探测到锁屏窗口，表现为整批文案断言超时。
// 该命令属于尽力而为的前置动作，失败不阻断用例，只记录日志。
export async function wakeUpScreen(tag: string): Promise<void> {
  if (!await shellCommand('power-shell wakeup', tag)) {
    logInfo(tag, 'wakeUpScreen skipped, device may already be awake or command unsupported');
  }
  await waitMs(SHELL_SETTLE_TIME);
}

// 把被测应用切到后台：用于验证「切后台再拉起」后首页状态不重复也不丢失。
export async function pressHome(driver: Driver, tag: string): Promise<boolean> {
  try {
    await driver.pressHome();
    await delay(driver, UI_SETTLE_TIME);
    return true;
  } catch (error) {
    logInfo(tag, 'pressHome failed: ' + JSON.stringify(error));
    return false;
  }
}

// 套件级设备前置准备：唤醒屏幕，并把应用收敛到首页。
// 这里刻意不强制停止应用进程：测试代码与 TestAbility 运行在同一应用进程内（与测试 HAP 的
// bundleName / moduleName 相同），强制停止会连带杀死当前测试会话。遗留的 uitest 守护进程
// 同样只能在测试拉起之前由 hdc shell pkill -f uitest 处理，命令详见 ohosTest.md。
export async function prepareDevice(driver: Driver, tag: string): Promise<void> {
  await wakeUpScreen(tag);
  const ready: boolean = await ensureIndex(driver, tag);
  logInfo(tag, 'prepareDevice done, index ready=' + ready.toString());
}

export async function findText(driver: Driver, text: string, tag: string): Promise<Component | undefined> {
  for (const candidate of textCandidates(text)) {
    try {
      const component: Component = await driver.findComponent(ON.text(candidate));
      if (component !== undefined && component !== null) {
        return component;
      }
    } catch (error) {
      logInfo(tag, 'findText failed: ' + candidate + ' -> ' + JSON.stringify(error));
    }
  }
  return undefined;
}

export async function findId(driver: Driver, id: string, tag: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo(tag, 'findId failed: ' + id + ' -> ' + JSON.stringify(error));
    return undefined;
  }
}

export async function findType(driver: Driver, typeName: string, tag: string): Promise<Component | undefined> {
  try {
    const component: Component = await driver.findComponent(ON.type(typeName));
    if (component === undefined || component === null) {
      return undefined;
    }
    return component;
  } catch (error) {
    logInfo(tag, 'findType failed: ' + typeName + ' -> ' + JSON.stringify(error));
    return undefined;
  }
}

export async function waitForText(driver: Driver, text: string, tag: string,
  timeout: number = WAIT_TIMEOUT): Promise<boolean> {
  const deadline: number = Date.now() + timeout;
  do {
    if (await findText(driver, text, tag) !== undefined) {
      return true;
    }
    await delay(driver, 300);
  } while (Date.now() < deadline);
  logInfo(tag, 'waitForText timeout: ' + text);
  return false;
}

export async function countText(driver: Driver, text: string, tag: string): Promise<number> {
  let maxCount: number = 0;
  for (const candidate of textCandidates(text)) {
    try {
      // 无匹配时框架返回 null，需要同时兼容 null 与空数组两种结果。
      const components: Component[] | null = await driver.findComponents(ON.text(candidate));
      const count: number = (components === null || components === undefined) ? 0 : components.length;
      if (count > maxCount) {
        maxCount = count;
      }
    } catch (error) {
      logInfo(tag, 'countText failed: ' + candidate + ' -> ' + JSON.stringify(error));
    }
  }
  return maxCount;
}

export async function countType(driver: Driver, typeName: string, tag: string): Promise<number> {
  try {
    // 无匹配时框架返回 null，直接取 length 会抛 TypeError，这里统一归一为 0。
    const components: Component[] | null = await driver.findComponents(ON.type(typeName));
    return (components === null || components === undefined) ? 0 : components.length;
  } catch (error) {
    logInfo(tag, 'countType failed: ' + typeName + ' -> ' + JSON.stringify(error));
    return -1;
  }
}

// 读取当前页面全部文本组件的内容，用于校验状态栏这类运行时拼接的文案。
export async function collectTexts(driver: Driver, tag: string): Promise<string[]> {
  const texts: string[] = [];
  try {
    const components: Component[] = await driver.findComponents(ON.type('Text'));
    for (const component of components) {
      try {
        texts.push(await component.getText());
      } catch (error) {
        logInfo(tag, 'collectTexts getText failed: ' + JSON.stringify(error));
      }
    }
  } catch (error) {
    logInfo(tag, 'collectTexts failed: ' + JSON.stringify(error));
  }
  return texts;
}

export async function textOfId(driver: Driver, id: string, tag: string): Promise<string> {
  const component: Component | undefined = await findId(driver, id, tag);
  if (component === undefined) {
    logInfo(tag, 'textOfId failed, component not found: ' + id);
    return '';
  }
  try {
    return await component.getText();
  } catch (error) {
    logInfo(tag, 'textOfId failed: ' + id + ' -> ' + JSON.stringify(error));
    return '';
  }
}

export async function clickText(driver: Driver, text: string, tag: string): Promise<boolean> {
  const component: Component | undefined = await findText(driver, text, tag);
  if (component === undefined) {
    logInfo(tag, 'clickText failed, component not found: ' + text);
    return false;
  }
  try {
    await component.click();
    await delay(driver, CLICK_SETTLE_TIME);
  } catch (error) {
    logInfo(tag, 'clickText failed: ' + text + ' -> ' + JSON.stringify(error));
    return false;
  }
  return true;
}

// 同名文本可能同时出现在场景按钮与工具栏，工具栏在布局中靠后，故取最后一个匹配项点击。
export async function clickLastText(driver: Driver, text: string, tag: string): Promise<boolean> {
  for (const candidate of textCandidates(text)) {
    try {
      const components: Component[] | null = await driver.findComponents(ON.text(candidate));
      if (components === null || components === undefined || components.length === 0) {
        continue;
      }
      await components[components.length - 1].click();
      await delay(driver, CLICK_SETTLE_TIME);
      return true;
    } catch (error) {
      logInfo(tag, 'clickLastText failed: ' + candidate + ' -> ' + JSON.stringify(error));
    }
  }
  logInfo(tag, 'clickLastText failed, component not found: ' + text);
  return false;
}

export async function clickId(driver: Driver, id: string, tag: string): Promise<boolean> {
  const component: Component | undefined = await findId(driver, id, tag);
  if (component === undefined) {
    logInfo(tag, 'clickId failed, component not found: ' + id);
    return false;
  }
  try {
    await component.click();
    await delay(driver, CLICK_SETTLE_TIME);
  } catch (error) {
    logInfo(tag, 'clickId failed: ' + id + ' -> ' + JSON.stringify(error));
    return false;
  }
  return true;
}

export async function checkedOfId(driver: Driver, id: string, tag: string): Promise<boolean> {
  const component: Component | undefined = await findId(driver, id, tag);
  if (component === undefined) {
    return false;
  }
  try {
    return await component.isChecked();
  } catch (error) {
    logInfo(tag, 'checkedOfId failed: ' + id + ' -> ' + JSON.stringify(error));
    return false;
  }
}

export async function countId(driver: Driver, id: string, tag: string): Promise<number> {
  try {
    // 无匹配时框架返回 null，直接取 length 会抛 TypeError，这里统一归一为 0。
    const components: Component[] | null = await driver.findComponents(ON.id(id));
    return (components === null || components === undefined) ? 0 : components.length;
  } catch (error) {
    logInfo(tag, 'countId failed: ' + id + ' -> ' + JSON.stringify(error));
    return 0;
  }
}

export async function waitForId(driver: Driver, id: string, tag: string,
  timeout: number = WAIT_TIMEOUT): Promise<boolean> {
  const deadline: number = Date.now() + timeout;
  do {
    if (await findId(driver, id, tag) !== undefined) {
      return true;
    }
    await delay(driver, 300);
  } while (Date.now() < deadline);
  logInfo(tag, 'waitForId timeout: ' + id);
  return false;
}

// 在可滚动列表里按 id 定位条目：首屏找不到时在 List 容器内逐屏滚动搜索。
export async function scrollToId(driver: Driver, id: string, tag: string): Promise<boolean> {
  if (await findId(driver, id, tag) !== undefined) {
    return true;
  }
  const list: Component | undefined = await findType(driver, 'List', tag);
  if (list === undefined) {
    logInfo(tag, 'scrollToId failed, list not found: ' + id);
    return false;
  }
  try {
    const component: Component = await list.scrollSearch(ON.id(id));
    if (component !== undefined && component !== null) {
      await delay(driver, CLICK_SETTLE_TIME);
      return true;
    }
  } catch (error) {
    logInfo(tag, 'scrollSearch failed: ' + id + ' -> ' + JSON.stringify(error));
  }
  return false;
}

// 系统返回不依赖页面文案与设备语言，逐级返回统一走这里。
export async function clickBack(driver: Driver, tag: string): Promise<boolean> {
  try {
    await driver.pressBack();
    await delay(driver, CLICK_SETTLE_TIME);
    return true;
  } catch (error) {
    logInfo(tag, 'pressBack failed: ' + JSON.stringify(error));
    return false;
  }
}

// 在首页列表里按入口 key 点击：首屏、底部与顶部三次尝试，覆盖排在屏幕外的入口。
export async function clickIndexItem(driver: Driver, key: string, tag: string): Promise<boolean> {
  const id: string = indexItemId(key);
  if (!await ensureIndex(driver, tag)) {
    return false;
  }
  if (await scrollToId(driver, id, tag) && await clickId(driver, id, tag)) {
    return true;
  }
  await scrollListToBottom(driver, tag);
  if (await clickId(driver, id, tag)) {
    return true;
  }
  await scrollListToTop(driver, tag);
  return await clickId(driver, id, tag);
}

// 从首页进入能力矩阵目录页。
export async function openCatalog(driver: Driver, tag: string): Promise<boolean> {
  if (!await clickIndexItem(driver, ENTRY_CAPABILITY, tag)) {
    return false;
  }
  return await waitForId(driver, ID_CATALOG_PAGE_TITLE, tag);
}

// 从首页进入专题目录页。
export async function openTopicCatalog(driver: Driver, tag: string): Promise<boolean> {
  if (!await clickIndexItem(driver, ENTRY_TOPIC, tag)) {
    return false;
  }
  return await waitForId(driver, ID_TOPIC_CATALOG_PAGE_TITLE, tag);
}

// 在能力矩阵目录页里打开指定能力域。
export async function openCapabilityGroup(driver: Driver, groupKey: string, tag: string): Promise<boolean> {
  const id: string = catalogItemId(groupKey);
  if (!await scrollToId(driver, id, tag)) {
    return false;
  }
  if (!await clickId(driver, id, tag)) {
    return false;
  }
  return await waitForId(driver, groupTitleId(groupKey), tag);
}

// 在专题目录页里打开指定专题。
export async function openTopicGroup(driver: Driver, groupKey: string, tag: string): Promise<boolean> {
  const id: string = topicItemId(groupKey);
  if (!await scrollToId(driver, id, tag)) {
    return false;
  }
  if (!await clickId(driver, id, tag)) {
    return false;
  }
  return await waitForId(driver, groupTitleId(groupKey), tag);
}

// 从首页直接进入单个演示页，并等待该页的标记控件出现。
export async function openDemo(driver: Driver, key: string, markerId: string, tag: string): Promise<boolean> {
  if (!await clickIndexItem(driver, key, tag)) {
    return false;
  }
  const entered: boolean = await waitForId(driver, markerId, tag);
  logInfo(tag, 'openDemo ' + key + ' marker=' + markerId + ' result=' + entered.toString());
  return entered;
}

// 在能力域或专题页面内切换场景。
export async function clickScene(driver: Driver, groupKey: string, sceneId: number, tag: string): Promise<boolean> {
  return await clickId(driver, sceneButtonId(groupKey, sceneId), tag);
}

// 保证当前处于首页：先逐级返回（上一用例可能停在演示页），仍失败才重新拉起应用。
export async function ensureIndex(driver: Driver, tag: string): Promise<boolean> {
  if (await findId(driver, ID_INDEX_TITLE, tag) !== undefined) {
    return true;
  }
  // 列表可能停在下半部分，先滚回顶部再判断。
  await scrollListToTop(driver, tag);
  if (await findId(driver, ID_INDEX_TITLE, tag) !== undefined) {
    return true;
  }
  for (let step = 0; step < MAX_BACK_STEPS; step++) {
    if (await findId(driver, ID_INDEX_TITLE, tag) !== undefined) {
      return true;
    }
    if (!await clickBack(driver, tag)) {
      break;
    }
  }
  if (await findId(driver, ID_INDEX_TITLE, tag) !== undefined) {
    return true;
  }
  // 路由刚切换时控件树可能还在动画中，重新拉起应用后也允许再重试一次。
  logInfo(tag, 'ensureIndex relaunch ability');
  if (!await launchAbility(tag)) {
    logInfo(tag, 'ensureIndex launchAbility failed');
    return false;
  }
  await delay(driver, UI_SETTLE_TIME);
  if (await waitForId(driver, ID_INDEX_TITLE, tag)) {
    return true;
  }
  logInfo(tag, 'ensureIndex retry after relaunch');
  await delay(driver, UI_SETTLE_TIME);
  return await waitForId(driver, ID_INDEX_TITLE, tag);
}

// 把首页列表滚回顶部，保证前几项入口重新可见。
export async function scrollListToTop(driver: Driver, tag: string): Promise<void> {
  const list: Component | undefined = await findType(driver, 'List', tag);
  if (list === undefined) {
    return;
  }
  try {
    await list.scrollToTop();
    await delay(driver, CLICK_SETTLE_TIME);
  } catch (error) {
    logInfo(tag, 'scrollToTop failed: ' + JSON.stringify(error));
  }
}

// 把首页列表滚到底部，用于定位排在屏幕外的入口。
export async function scrollListToBottom(driver: Driver, tag: string): Promise<void> {
  const list: Component | undefined = await findType(driver, 'List', tag);
  if (list === undefined) {
    return;
  }
  try {
    await list.scrollToBottom();
    await delay(driver, CLICK_SETTLE_TIME);
  } catch (error) {
    logInfo(tag, 'scrollToBottom failed: ' + JSON.stringify(error));
  }
}

// 在可滚动列表里定位条目：首屏找不到时在 List 容器内逐屏滚动搜索，覆盖排到屏幕外的能力域。
export async function scrollToTitle(driver: Driver, text: string, tag: string): Promise<boolean> {
  if (await findText(driver, text, tag) !== undefined) {
    return true;
  }
  const list: Component | undefined = await findType(driver, 'List', tag);
  if (list === undefined) {
    logInfo(tag, 'scrollToTitle failed, list not found: ' + text);
    return false;
  }
  for (const candidate of textCandidates(text)) {
    try {
      const component: Component = await list.scrollSearch(ON.text(candidate));
      if (component !== undefined && component !== null) {
        await delay(driver, CLICK_SETTLE_TIME);
        return true;
      }
    } catch (error) {
      logInfo(tag, 'scrollSearch failed: ' + candidate + ' -> ' + JSON.stringify(error));
    }
  }
  return false;
}

// 从首页点击能力入口，并等待该页特有的标记控件出现。
export async function enterPage(driver: Driver, entryTitle: string, marker: string,
  tag: string): Promise<boolean> {
  if (!await ensureIndex(driver, tag)) {
    return false;
  }
  let clicked: boolean = await clickText(driver, entryTitle, tag);
  if (!clicked) {
    // 入口可能排在屏幕外：先滚到底部，再退回顶部兜底重试。
    await scrollListToBottom(driver, tag);
    clicked = await clickText(driver, entryTitle, tag);
  }
  if (!clicked) {
    await scrollListToTop(driver, tag);
    clicked = await clickText(driver, entryTitle, tag);
  }
  if (!clicked) {
    return false;
  }
  const entered: boolean = await waitForText(driver, marker, tag);
  logInfo(tag, 'enterPage ' + entryTitle + ' marker=' + marker + ' result=' + entered.toString());
  return entered;
}

export async function backToIndex(driver: Driver, tag: string): Promise<boolean> {
  if (await findId(driver, ID_INDEX_TITLE, tag) !== undefined) {
    return true;
  }
  if (!await clickBack(driver, tag)) {
    return false;
  }
  return await waitForId(driver, ID_INDEX_TITLE, tag);
}
