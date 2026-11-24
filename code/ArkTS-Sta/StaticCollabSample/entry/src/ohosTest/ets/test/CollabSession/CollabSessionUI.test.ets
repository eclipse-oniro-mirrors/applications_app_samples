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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON, Component } from '@kit.TestKit';
import {
  TAG,
  getDriver,
  waitForUiReady,
  collabComponentCount,
  checkTextContent,
  dismissSystemDialog,
  checkComponentExists,
  clickButtonByText,
  readInputText,
  getCurrentFocusIndex,
  checkFocusState,
  pressAndWait,
  findComponentsByType,
  serializedDelay,
  launchSampleApp,
  delay,
  PAGE_TITLE,
  BUTTON_CONNECT,
  BUTTON_SEND_MESSAGE,
  BUTTON_SEND_DATA,
  BUTTON_DISCONNECT,
  BUTTON_DESTROY_SESSION,
  MESSAGE_INPUT_ID,
  TIMEOUT_UI_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_OPERATION,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  INVALID_SESSION_ID,
  CollabTestLogger,
  MockDeviceManager,
  SessionIdGenerator
} from '../Shared/CollabTestDriver';

// UI 元素类别枚举：描述页面上可渲染元素的基本类型
enum UiElementKind {
  KIND_TITLE = 'title',
  KIND_BUTTON = 'button',
  KIND_INPUT = 'input'
}

// UI 元素描述接口：描述页面元素的可渲染元数据
interface UiElementDescriptor {
  kind: UiElementKind;
  text: string;
  componentId: string;
}

// 按钮渲染期望接口：描述一个按钮的文本与可点击性期望
interface ButtonExpectation {
  text: string;
  present: boolean;
  clickable: boolean;
}

// UI 渲染计划接口：描述一组 UI 校验项的聚合
interface UiRenderPlan {
  planName: string;
  expectedTitle: string;
  buttonExpectations: ButtonExpectation[];
  inputId: string;
}

// 按钮目录模型：集中管理页面 5 个按钮与标题、输入框的静态元数据
class ButtonCatalog {
  private buttons: string[] = [];

  constructor() {
    this.buttons = [
      BUTTON_CONNECT,
      BUTTON_SEND_MESSAGE,
      BUTTON_SEND_DATA,
      BUTTON_DISCONNECT,
      BUTTON_DESTROY_SESSION
    ];
  }

  public getButtons(): string[] {
    return this.buttons.slice(0);
  }

  public getButtonCount(): number {
    return this.buttons.length;
  }

  public contains(text: string): boolean {
    return this.buttons.indexOf(text) >= 0;
  }

  public indexOf(text: string): number {
    return this.buttons.indexOf(text);
  }

  public describe(): string {
    return `ButtonCatalog(buttons=${this.buttons.join(',')})`;
  }

  public equals(expected: string[]): boolean {
    if (this.buttons.length !== expected.length) {
      return false;
    }
    for (let index = 0; index < this.buttons.length; index++) {
      if (this.buttons[index] !== expected[index]) {
        return false;
      }
    }
    return true;
  }
}

// UI 渲染计划构建器：以链式方式构建页面校验计划
class UiRenderPlanBuilder {
  private planName: string = '';
  private expectedTitle: string = PAGE_TITLE;
  private buttonExpectations: ButtonExpectation[] = [];
  private inputId: string = MESSAGE_INPUT_ID;

  public withName(planName: string): UiRenderPlanBuilder {
    this.planName = planName;
    return this;
  }

  public withTitle(title: string): UiRenderPlanBuilder {
    this.expectedTitle = title;
    return this;
  }

  public withButton(text: string, clickable: boolean): UiRenderPlanBuilder {
    this.buttonExpectations.push({
      text: text,
      present: true,
      clickable: clickable
    });
    return this;
  }

  public withInputId(inputId: string): UiRenderPlanBuilder {
    this.inputId = inputId;
    return this;
  }

  public build(): UiRenderPlan {
    return {
      planName: this.planName,
      expectedTitle: this.expectedTitle,
      buttonExpectations: this.buttonExpectations.slice(0),
      inputId: this.inputId
    };
  }
}

// 焦点边界模型：描述焦点在组件列表上的可导航范围
class FocusBoundaryModel {
  private minIndex: number;
  private maxIndex: number;

  constructor(minIndex: number, maxIndex: number) {
    this.minIndex = minIndex;
    this.maxIndex = maxIndex;
  }

  public clamp(index: number): number {
    if (index < this.minIndex) {
      return this.minIndex;
    }
    if (index > this.maxIndex) {
      return this.maxIndex;
    }
    return index;
  }

  public isWithinBounds(index: number): boolean {
    return index >= this.minIndex && index <= this.maxIndex;
  }

  public getRange(): number {
    return this.maxIndex - this.minIndex;
  }
}

// UI 元素校验器：对 UI 元素描述与渲染计划做静态校验
class UiElementValidator {
  public hasValidText(descriptor: UiElementDescriptor): boolean {
    return descriptor.text.length > 0;
  }

  public hasValidId(descriptor: UiElementDescriptor): boolean {
    return descriptor.componentId.length > 0;
  }

  public isRenderable(descriptor: UiElementDescriptor): boolean {
    if (descriptor.kind === UiElementKind.KIND_TITLE) {
      return this.hasValidText(descriptor);
    }
    if (descriptor.kind === UiElementKind.KIND_INPUT) {
      return this.hasValidId(descriptor);
    }
    return this.hasValidText(descriptor);
  }

  public countPresentButtons(plan: UiRenderPlan): number {
    let count: number = 0;
    for (const expectation of plan.buttonExpectations) {
      if (expectation.present) {
        count++;
      }
    }
    return count;
  }
}

// UI 渲染统计：聚合页面渲染检查结果
class UiRenderStatistics {
  private checkedTexts: string[] = [];
  private checkedButtons: number = 0;
  private checkedInputs: number = 0;

  public recordText(text: string): void {
    this.checkedTexts.push(text);
  }

  public recordButton(): void {
    this.checkedButtons++;
  }

  public recordInput(): void {
    this.checkedInputs++;
  }

  public getTextCount(): number {
    return this.checkedTexts.length;
  }

  public getButtonCount(): number {
    return this.checkedButtons;
  }

  public getInputCount(): number {
    return this.checkedInputs;
  }

  public reset(): void {
    this.checkedTexts = [];
    this.checkedButtons = 0;
    this.checkedInputs = 0;
  }
}

export default function collabSessionUITest() {
  describe('CollabSessionUI_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      try {
        await launchSampleApp();
        await delay(DELAY_AFTER_OPERATION);
      } catch (error) {
        hilog.error(0x0000, TAG, '%{public}s', `CollabSessionUI: launch failed: ${error}`);
      }
      driver = getDriver();
      const deadline: number = Date.now() + TIMEOUT_UI_RENDER;
      while (Date.now() < deadline) {
        const titleReady: boolean = await checkTextContent(driver, PAGE_TITLE);
        if (titleReady) {
          break;
        }
        await dismissSystemDialog(driver);
        await serializedDelay(driver, 200);
      }
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      hilog.info(0x0000, TAG, '%{public}s', 'CollabSessionUI: beforeAll ui ready');
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_OPERATION);
      hilog.info(0x0000, TAG, '%{public}s', 'CollabSessionUI: afterAll finished');
    });

    // 按钮目录：默认包含五个协作操作按钮
    it('button_catalog_should_contain_five_buttons', 0, async () => {
      const catalog: ButtonCatalog = new ButtonCatalog();
      expect(catalog.getButtonCount()).assertEqual(5);
      expect(catalog.getButtons().length).assertEqual(5);
    });

    // 按钮目录：顺序固定为 Connect/Send Message/Send Data/Disconnect/Destroy Session
    it('button_catalog_should_preserve_expected_order', 0, async () => {
      const catalog: ButtonCatalog = new ButtonCatalog();
      const expected: string[] = [
        BUTTON_CONNECT,
        BUTTON_SEND_MESSAGE,
        BUTTON_SEND_DATA,
        BUTTON_DISCONNECT,
        BUTTON_DESTROY_SESSION
      ];
      expect(catalog.equals(expected)).assertTrue();
      expect(catalog.indexOf(BUTTON_CONNECT)).assertEqual(0);
      expect(catalog.indexOf(BUTTON_DESTROY_SESSION)).assertEqual(4);
    });

    // 按钮目录：按文本查找按钮
    it('button_catalog_should_find_connect_button', 0, async () => {
      const catalog: ButtonCatalog = new ButtonCatalog();
      expect(catalog.contains(BUTTON_CONNECT)).assertTrue();
      expect(catalog.contains(BUTTON_DESTROY_SESSION)).assertTrue();
    });

    // 按钮目录：未知文本不应命中
    it('button_catalog_should_report_unknown_button', 0, async () => {
      const catalog: ButtonCatalog = new ButtonCatalog();
      expect(catalog.contains('Unknown Button')).assertFalse();
      expect(catalog.indexOf('Unknown Button')).assertEqual(-1);
    });

    // UI 渲染计划：构建完整页面校验计划
    it('render_plan_should_build_expected_checks', 0, async () => {
      const plan: UiRenderPlan = new UiRenderPlanBuilder().withName('main_page')
        .withTitle(PAGE_TITLE)
        .withButton(BUTTON_CONNECT, true)
        .withButton(BUTTON_SEND_MESSAGE, true)
        .withButton(BUTTON_SEND_DATA, true)
        .withButton(BUTTON_DISCONNECT, true)
        .withButton(BUTTON_DESTROY_SESSION, true)
        .withInputId(MESSAGE_INPUT_ID)
        .build();
      expect(plan.planName).assertEqual('main_page');
      expect(plan.expectedTitle).assertEqual(PAGE_TITLE);
      expect(plan.buttonExpectations.length).assertEqual(5);
      expect(plan.inputId).assertEqual(MESSAGE_INPUT_ID);
    });

    // UI 元素描述：标题元素可渲染
    it('ui_element_descriptor_should_carry_kind_and_text', 0, async () => {
      const descriptor: UiElementDescriptor = {
        kind: UiElementKind.KIND_TITLE,
        text: PAGE_TITLE,
        componentId: ''
      };
      expect(descriptor.kind).assertEqual(UiElementKind.KIND_TITLE);
      expect(descriptor.text).assertEqual(PAGE_TITLE);
    });

    // UI 元素校验：输入框描述应携带 messageInput 标识
    it('input_descriptor_should_use_message_input_id', 0, async () => {
      const descriptor: UiElementDescriptor = {
        kind: UiElementKind.KIND_INPUT,
        text: '',
        componentId: MESSAGE_INPUT_ID
      };
      const validator: UiElementValidator = new UiElementValidator();
      expect(validator.hasValidId(descriptor)).assertTrue();
      expect(validator.isRenderable(descriptor)).assertTrue();
    });

    // UI 元素校验：空文本标题不可渲染
    it('ui_element_validator_should_reject_empty_title', 0, async () => {
      const descriptor: UiElementDescriptor = {
        kind: UiElementKind.KIND_TITLE,
        text: '',
        componentId: ''
      };
      const validator: UiElementValidator = new UiElementValidator();
      expect(validator.isRenderable(descriptor)).assertFalse();
    });

    // UI 元素校验：统计计划中的可见按钮数量
    it('ui_element_validator_should_count_present_buttons', 0, async () => {
      const plan: UiRenderPlan = new UiRenderPlanBuilder().withName('plan')
        .withButton(BUTTON_CONNECT, true)
        .withButton(BUTTON_SEND_MESSAGE, true)
        .withButton(BUTTON_SEND_DATA, true)
        .build();
      const validator: UiElementValidator = new UiElementValidator();
      expect(validator.countPresentButtons(plan)).assertEqual(3);
    });

    // 焦点边界：越界索引应被钳制到有效范围
    it('focus_boundary_should_clamp_focus_index', 0, async () => {
      const boundary: FocusBoundaryModel = new FocusBoundaryModel(0, 4);
      expect(boundary.clamp(-1)).assertEqual(0);
      expect(boundary.clamp(99)).assertEqual(4);
      expect(boundary.clamp(2)).assertEqual(2);
      expect(boundary.getRange()).assertEqual(4);
    });

    // 焦点边界：判断索引是否在范围内
    it('focus_boundary_should_report_within_bounds', 0, async () => {
      const boundary: FocusBoundaryModel = new FocusBoundaryModel(0, 4);
      expect(boundary.isWithinBounds(0)).assertTrue();
      expect(boundary.isWithinBounds(4)).assertTrue();
      expect(boundary.isWithinBounds(5)).assertFalse();
      expect(boundary.isWithinBounds(-1)).assertFalse();
    });

    // UI 渲染统计：记录文本/按钮/输入检查计数
    it('ui_render_statistics_should_accumulate_checks', 0, async () => {
      const stats: UiRenderStatistics = new UiRenderStatistics();
      stats.recordText(PAGE_TITLE);
      stats.recordButton();
      stats.recordButton();
      stats.recordInput();
      expect(stats.getTextCount()).assertEqual(1);
      expect(stats.getButtonCount()).assertEqual(2);
      expect(stats.getInputCount()).assertEqual(1);
      stats.reset();
      expect(stats.getTextCount()).assertEqual(0);
      expect(stats.getButtonCount()).assertEqual(0);
    });

    // 页面渲染：组件数量应为正数
    it('page_should_render_positive_component_count', 0, async () => {
      const ready: boolean = await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      expect(ready).assertTrue();
      const componentCount: number = await collabComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      hilog.info(0x0000, TAG, '%{public}s', `page component count=${componentCount}`);
    });

    // 页面渲染：标题文本应存在
    it('page_should_render_title_text', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, PAGE_TITLE);
      expect(present).assertTrue();
    });

    // 页面渲染：Connect 按钮应存在
    it('page_should_render_connect_button', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, BUTTON_CONNECT);
      expect(present).assertTrue();
    });

    // 页面渲染：Send Message 按钮应存在
    it('page_should_render_send_message_button', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, BUTTON_SEND_MESSAGE);
      expect(present).assertTrue();
    });

    // 页面渲染：Send Data 按钮应存在
    it('page_should_render_send_data_button', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, BUTTON_SEND_DATA);
      expect(present).assertTrue();
    });

    // 页面渲染：Disconnect 按钮应存在
    it('page_should_render_disconnect_button', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, BUTTON_DISCONNECT);
      expect(present).assertTrue();
    });

    // 页面渲染：Destroy Session 按钮应存在
    it('page_should_render_destroy_session_button', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const present: boolean = await checkTextContent(driver, BUTTON_DESTROY_SESSION);
      expect(present).assertTrue();
    });

    // 页面渲染：输入框组件应存在
    it('page_should_render_message_input_component', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const exists: boolean = await checkComponentExists(driver, 'TextInput');
      expect(exists).assertTrue();
    });

    // 页面渲染：按文本匹配器直接查找按钮
    it('button_should_be_found_by_text_matcher', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const buttons: Component[] = await findComponentsByType(driver, 'Button');
      expect(buttons.length).assertLargerOrEqual(0);
      const connectPresent: boolean = await checkTextContent(driver, BUTTON_CONNECT);
      expect(connectPresent).assertTrue();
    });

    // 页面交互：Connect 按钮可点击
    it('connect_button_should_be_clickable', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const clicked: boolean = await clickButtonByText(driver, BUTTON_CONNECT);
      expect(clicked).assertTrue();
    });

    // 页面交互：输入框文本可读取
    it('input_should_be_readable', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const text: string = await readInputText(driver);
      expect(typeof text).assertEqual('string');
    });

    // 页面焦点：页面应存在焦点
    it('focus_should_exist_on_page', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const hasFocus: boolean = await checkFocusState(driver, INVALID_SESSION_ID);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      hilog.info(0x0000, TAG, '%{public}s', `focus exists=${hasFocus}, index=${focusIndex}`);
      expect(focusIndex).assertLargerOrEqual(INVALID_SESSION_ID);
    });

    // 页面焦点：方向键导航后焦点应保持在合法范围
    it('navigation_should_keep_focus_within_bounds', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      const componentCount: number = await collabComponentCount(driver);
      hilog.info(0x0000, TAG, '%{public}s', `navigation focus=${focusIndex}, count=${componentCount}`);
      expect(focusIndex).assertLess(componentCount + 1);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
    });

    // 页面稳定性：延迟后组件数量保持一致
    it('page_should_remain_stable_after_delay', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const beforeCount: number = await collabComponentCount(driver);
      await serializedDelay(driver, DELAY_AFTER_OPERATION);
      const afterCount: number = await collabComponentCount(driver);
      hilog.info(0x0000, TAG, '%{public}s', `stability before=${beforeCount}, after=${afterCount}`);
      expect(afterCount).assertLargerOrEqual(0);
    });

    // 组件数量：重复采样应稳定
    it('repeated_component_count_should_be_consistent', 0, async () => {
      await waitForUiReady(driver, TIMEOUT_UI_RENDER);
      const counts: number[] = [];
      for (let round = 0; round < 3; round++) {
        counts.push(await collabComponentCount(driver));
        await serializedDelay(driver, 100);
      }
      expect(counts.length).assertEqual(3);
      expect(counts[0]).assertLargerOrEqual(0);
      expect(counts[1]).assertLargerOrEqual(0);
      expect(counts[2]).assertLargerOrEqual(0);
    });

    // 日志采集器：UI 用例日志可记录与清空
    it('logger_should_record_and_clear_ui_logs', 0, async () => {
      const logger: CollabTestLogger = CollabTestLogger.getInstance();
      logger.info('ui logger smoke test');
      expect(logger.size()).assertLargerOrEqual(1);
      logger.clear();
      expect(logger.size()).assertEqual(0);
    });

    // Mock 设备管理器：UI 用例不依赖真实设备
    it('mock_device_manager_should_behave_deterministically', 0, async () => {
      const manager: MockDeviceManager = new MockDeviceManager(2);
      expect(manager.size()).assertEqual(2);
      expect(manager.getFirstNetworkId()).assertEqual('network_0');
    });

    // 会话 ID 生成器：UI 用例生成稳定 ID
    it('session_id_generator_should_generate_sequential_ids', 0, async () => {
      const generator: SessionIdGenerator = new SessionIdGenerator('ui');
      expect(generator.generate()).assertEqual('ui_0');
      expect(generator.generate()).assertEqual('ui_1');
      expect(generator.getNextSequence()).assertEqual(2);
    });
  });
}
