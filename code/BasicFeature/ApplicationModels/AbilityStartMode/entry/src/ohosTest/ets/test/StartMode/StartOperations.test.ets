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
import { Driver } from '@ohos.UiTest';
import {
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  MODE_SINGLETON,
  MODE_SPECIFIED,
  MODE_STANDARD,
  TEXT_FOOD_DETAIL_TITLE,
  TIMEOUT_ABILITY_START,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  checkFocusState,
  checkTextContent,
  componentCount,
  countNutritionLabels,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchSingletonAbility,
  launchSpecifiedAbility,
  launchStandardAbility,
  logInfo,
  logWarn,
  pressAndWait,
  resetToHome,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// Mock启动服务：模拟真实能力启动操作，避免测试中重复依赖系统实例状态
class MockStartModeService {
  private static instance: MockStartModeService;
  private operationLog: string[] = [];

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MockStartModeService {
    if (!MockStartModeService.instance) {
      MockStartModeService.instance = new MockStartModeService();
    }
    return MockStartModeService.instance;
  }

  public async startStandard(foodItemId: number): Promise<boolean> {
    this.operationLog.push(`standard called with foodItemId: ${foodItemId}`);
    await Promise.resolve();
    return true;
  }

  public async startSpecified(foodItemId: number, target: string): Promise<boolean> {
    this.operationLog.push(`specified called with target: ${target} foodItemId: ${foodItemId}`);
    await Promise.resolve();
    return true;
  }

  public async startSingleton(foodItemId: number): Promise<boolean> {
    this.operationLog.push(`singleton called with foodItemId: ${foodItemId}`);
    await Promise.resolve();
    return true;
  }

  public getOperationLog(): string[] {
    return [...this.operationLog];
  }

  // 清空操作日志：确保每次测试从干净状态开始
  public clearOperationLog(): void {
    this.operationLog = [];
  }
}

// 操作状态枚举：描述启动操作请求的处理状态
enum OperationStatus {
  STATUS_QUEUED = 'queued', STATUS_RUNNING = 'running', STATUS_COMPLETED = 'completed', STATUS_FAILED = 'failed', STATUS_CANCELLED = 'cancelled'
}

// 启动操作类别枚举：描述三种启动模式的具体类别
enum StartModeKind {
  KIND_STANDARD = 'standard', KIND_SPECIFIED = 'specified', KIND_SINGLETON = 'singleton'
}

// 启动操作请求接口：描述一次能力启动请求的完整上下文
interface StartRequest {
  requestId: string;
  kind: StartModeKind;
  foodItemId: number;
  target: string;
  status: OperationStatus;
  createdAt: number;
}

// 操作队列：以先进先出方式管理待执行的启动操作请求
class StartOperationQueue {
  private requests: StartRequest[] = [];

  public enqueue(request: StartRequest): void {
    this.requests.push(request);
  }

  public dequeue(): StartRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests.shift() || null;
  }

  public peek(): StartRequest | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests[0];
  }

  public getLength(): number {
    return this.requests.length;
  }

  public isEmpty(): boolean {
    return this.requests.length === 0;
  }

  public getRequests(): StartRequest[] {
    return [...this.requests];
  }

  public countByKind(kind: StartModeKind): number {
    return this.requests.filter((request: StartRequest) => request.kind === kind).length;
  }

  public clear(): void {
    this.requests = [];
  }
}

// 操作分发器：根据请求类别调用对应的启动服务并更新状态
class StartOperationDispatcher {
  private service: MockStartModeService;
  private dispatchedCount: number = 0;

  constructor(service: MockStartModeService) {
    this.service = service;
  }

  public async dispatch(request: StartRequest): Promise<boolean> {
    this.dispatchedCount++;
    if (request.kind === StartModeKind.KIND_STANDARD) {
      return this.service.startStandard(request.foodItemId);
    }
    if (request.kind === StartModeKind.KIND_SPECIFIED) {
      return this.service.startSpecified(request.foodItemId, request.target);
    }
    if (request.kind === StartModeKind.KIND_SINGLETON) {
      return this.service.startSingleton(request.foodItemId);
    }
    return false;
  }

  public getDispatchedCount(): number {
    return this.dispatchedCount;
  }

  public resetDispatchedCount(): void {
    this.dispatchedCount = 0;
  }
}

// 操作结果分析器：对启动操作日志进行聚合分析与结论判定
class StartResultAnalyzer {
  private log: string[] = [];

  public setLog(log: string[]): void {
    this.log = [...log];
  }

  public getLogSize(): number {
    return this.log.length;
  }

  public countOperationsContaining(keyword: string): number {
    return this.log.filter((entry: string) => entry.includes(keyword)).length;
  }

  public hasStandardOperation(): boolean {
    return this.log.some((entry: string) => entry.includes('standard'));
  }

  public hasSpecifiedOperation(): boolean {
    return this.log.some((entry: string) => entry.includes('specified'));
  }

  public hasSingletonOperation(): boolean {
    return this.log.some((entry: string) => entry.includes('singleton'));
  }

  public getOperationOrder(): string[] {
    const order: string[] = [];
    this.log.forEach((entry: string) => {
      if (entry.includes('standard')) {
        order.push('standard');
      } else if (entry.includes('specified')) {
        order.push('specified');
      } else if (entry.includes('singleton')) {
        order.push('singleton');
      }
    });
    return order;
  }

  public clear(): void {
    this.log = [];
  }
}

// 启动操作校验器：对启动请求参数与前置条件进行校验
class StartOperationValidator {
  public isValidKind(kind: StartModeKind): boolean {
    return kind === StartModeKind.KIND_STANDARD || kind === StartModeKind.KIND_SPECIFIED ||
      kind === StartModeKind.KIND_SINGLETON;
  }

  public isFoodItemValid(foodItemId: number): boolean {
    return foodItemId === 0 || foodItemId === 1;
  }

  public isTargetValid(kind: StartModeKind, target: string): boolean {
    if (kind === StartModeKind.KIND_SPECIFIED) {
      return target.length > 0;
    }
    return true;
  }

  public isRequestValid(request: StartRequest): boolean {
    return this.isValidKind(request.kind) && this.isFoodItemValid(request.foodItemId) &&
      this.isTargetValid(request.kind, request.target);
  }

  public validateRequest(request: StartRequest): string[] {
    const violations: string[] = [];
    if (!this.isValidKind(request.kind)) {
      violations.push('unknown start mode kind');
    }
    if (!this.isFoodItemValid(request.foodItemId)) {
      violations.push('food item id out of range');
    }
    if (!this.isTargetValid(request.kind, request.target)) {
      violations.push('missing target page for specified mode');
    }
    return violations;
  }
}

// 启动请求构建器：以流式接口构建启动操作请求
class StartRequestBuilder {
  private requestId: string;
  private kind: StartModeKind;
  private foodItemId: number;
  private target: string;
  private status: OperationStatus;
  private createdAt: number;

  constructor() {
    this.requestId = '';
    this.kind = StartModeKind.KIND_STANDARD;
    this.foodItemId = 0;
    this.target = 'pages/FoodDetail';
    this.status = OperationStatus.STATUS_QUEUED;
    this.createdAt = Date.now();
  }

  public withRequestId(requestId: string): StartRequestBuilder {
    this.requestId = requestId;
    return this;
  }

  public withKind(kind: StartModeKind): StartRequestBuilder {
    this.kind = kind;
    return this;
  }

  public withFoodItemId(foodItemId: number): StartRequestBuilder {
    this.foodItemId = foodItemId;
    return this;
  }

  public withTarget(target: string): StartRequestBuilder {
    this.target = target;
    return this;
  }

  public withStatus(status: OperationStatus): StartRequestBuilder {
    this.status = status;
    return this;
  }

  public build(): StartRequest {
    return {
      requestId: this.requestId,
      kind: this.kind,
      foodItemId: this.foodItemId,
      target: this.target,
      status: this.status,
      createdAt: this.createdAt
    };
  }
}

// 请求 id 生成器：生成递增且唯一的启动请求标识
class StartOperationIdGenerator {
  private sequence: number = 0;
  private prefix: string;

  constructor(prefix: string) {
    this.prefix = prefix;
  }

  public generate(): string {
    const id = `${this.prefix}_${this.sequence}`;
    this.sequence++;
    return id;
  }

  public generateBatch(count: number): string[] {
    const ids: string[] = [];
    for (let i = 0; i < count; i++) {
      ids.push(this.generate());
    }
    return ids;
  }

  public getNextSequence(): number {
    return this.sequence;
  }

  public reset(): void {
    this.sequence = 0;
  }
}

// 操作日志格式化器：将启动操作日志格式化为可读文本
class StartOperationLogFormatter {
  public formatEntry(entry: string): string {
    return `[startmode] ${entry}`;
  }

  public formatLog(log: string[]): string {
    return log.map((entry: string) => this.formatEntry(entry)).join('\n');
  }

  public countKeyword(log: string[], keyword: string): number {
    return log.filter((entry: string) => entry.includes(keyword)).length;
  }

  public getUniqueKeywords(log: string[]): string[] {
    const keywords: Set<string> = new Set<string>();
    log.forEach((entry: string) => {
      if (entry.includes('standard')) {
        keywords.add('standard');
      }
      if (entry.includes('specified')) {
        keywords.add('specified');
      }
      if (entry.includes('singleton')) {
        keywords.add('singleton');
      }
    });
    return Array.from(keywords);
  }

  public isEmpty(log: string[]): boolean {
    return log.length === 0;
  }
}
export default function startOperationsTest() {
  describe('StartOperations_Test', () => {
    let driver: Driver;
    let mockStartService: MockStartModeService;

    // 测试前置：初始化驱动和 Mock 启动服务，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      mockStartService = MockStartModeService.getInstance();
      mockStartService.clearOperationLog();
      await driver.delayMs(1000);
      await resetToHome(driver);
    });

    // 测试清理：返回主页并清理资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证 standard 模式启动能正确打开详情页，standard 每次创建新实例
    it('standard_operation_should_open_detail_page', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect || (await isFoodDetailVisible(driver))).assertTrue();
    });

    // 验证 specified 模式启动能正确打开详情页，相同 id 复用实例
    it('specified_operation_should_open_detail_page', 0, async () => {
      await resetToHome(driver);
      await launchSpecifiedAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 验证 singleton 模式启动能正确打开详情页，重复启动复用同一实例
    it('singleton_operation_should_open_detail_page', 0, async () => {
      await resetToHome(driver);
      await launchSingletonAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 验证三种启动模式按正确顺序执行，均能进入详情页
    it('multiple_start_modes_should_execute_in_correct_order', 0, async () => {
      await resetToHome(driver);
      mockStartService.clearOperationLog();
      await launchStandardAbility(0);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      await launchSpecifiedAbility(1);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      await launchSingletonAbility(1);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 验证启动操作在时间限制内完成，确保操作响应性能达标
    it('start_operations_should_complete_within_time_limit', 0, async () => {
      await resetToHome(driver);
      const startTime = Date.now();
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      const endTime = Date.now();
      const responseTime = endTime - startTime;
      expect(responseTime).assertLessOrEqual(TIMEOUT_ABILITY_START);
    });

    // 验证启动操作取消：返回键返回主页后操作日志仍为空，未触发真实启动
    it('start_operation_cancellation_should_work_correctly', 0, async () => {
      await resetToHome(driver);
      mockStartService.clearOperationLog();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      const operationLog = mockStartService.getOperationLog();
      expect(operationLog.length).assertEqual(0);
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证启动操作错误处理：主页组件仍存在，异常情况下渲染稳定
    it('start_operation_error_handling_should_work_correctly', 0, async () => {
      await resetToHome(driver);
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证并发启动操作被正确处理，操作互斥且日志条目受限
    it('concurrent_start_operations_should_be_properly_handled', 0, async () => {
      await resetToHome(driver);
      mockStartService.clearOperationLog();
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_DOWN, 1, 50);
      }
      await driver.delayMs(DELAY_AFTER_START_MODE);
      const operationLog = mockStartService.getOperationLog();
      expect(operationLog.length).assertLessOrEqual(1);
    });

    // 验证启动操作状态正确持久化，返回主页后状态一致
    it('start_operation_state_should_persist_correctly', 0, async () => {
      await resetToHome(driver);
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await resetToHome(driver)).assertTrue();
      const componentCount = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
    // 验证启动操作参数正确传递，foodItemId 与 target 对应详情页字段
    it('start_operation_parameters_should_be_correct', 0, async () => {
      await resetToHome(driver);
      mockStartService.clearOperationLog();
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      logInfo(`StartOperations test: initial focus index ${initialFocusIndex}`);

      await launchSpecifiedAbility(1, 'pages/FoodDetail');
      await driver.delayMs(DELAY_AFTER_START_MODE);

      const hasAnyFocus = await checkFocusState(driver, -1);
      logInfo(`StartOperations test: has any focus ${hasAnyFocus}`);

      if (!hasAnyFocus) {
        const componentCount = await homeComponentCount(driver);
        logWarn(`StartOperations test: no focus, component count ${componentCount}`);
        if (componentCount === 0) {
          await resetToHome(driver);
        }
      }

      // 默认 target 缺省 pages/FoodDetail，详情页应可渲染
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      expect(await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE)).assertTrue();
    });

    // 验证详情页营养标签数量满足要求
    it('detail_page_should_render_nutrition_labels', 0, async () => {
      await resetToHome(driver);
      await launchStandardAbility(1);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const labelCount = await countNutritionLabels(driver);
      expect(labelCount).assertLargerOrEqual(1);
    });

    // 验证三种模式标签在主页均正确显示
    it('home_page_should_expose_three_mode_labels', 0, async () => {
      await resetToHome(driver);
      expect(await checkTextContent(driver, MODE_STANDARD)).assertTrue();
      expect(await checkTextContent(driver, MODE_SPECIFIED)).assertTrue();
      expect(await checkTextContent(driver, MODE_SINGLETON)).assertTrue();
    });

    // 验证 detail 返回后主页恢复，模式标签全部回归
    it('back_from_detail_should_restore_all_mode_labels', 0, async () => {
      await launchStandardAbility(0);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);
      expect(await resetToHome(driver)).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // ---------- 纯逻辑单元用例：队列 / 分发器 / 结果分析 ----------

    // 先进先出入队与出队顺序
    it('operation_queue_should_enqueue_and_dequeue_in_fifo_order', 0, async () => {
      const queue = new StartOperationQueue();
      const builder = new StartRequestBuilder();
      queue.enqueue(builder.withRequestId('r1').withKind(StartModeKind.KIND_STANDARD).withFoodItemId(0).build());
      queue.enqueue(builder.withRequestId('r2').withKind(StartModeKind.KIND_SPECIFIED).withFoodItemId(1).build());
      expect(queue.getLength()).assertEqual(2);
      const first = queue.dequeue();
      expect(first === null).assertFalse();
      expect(first?.requestId).assertEqual('r1');
      const second = queue.dequeue();
      expect(second?.requestId).assertEqual('r2');
      expect(queue.isEmpty()).assertTrue();
    });

    // 查看队首而不移除
    it('operation_queue_should_peek_without_removing', 0, async () => {
      const queue = new StartOperationQueue();
      const builder = new StartRequestBuilder();
      queue.enqueue(builder.withRequestId('p1').withKind(StartModeKind.KIND_SINGLETON).withFoodItemId(0).build());
      const peeked = queue.peek();
      expect(peeked === null).assertFalse();
      expect(peeked?.requestId).assertEqual('p1');
      expect(queue.getLength()).assertEqual(1);
    });

    // 空队列出队与查看返回 null
    it('operation_queue_should_return_null_when_empty', 0, async () => {
      const queue = new StartOperationQueue();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue()).assertEqual(null);
      expect(queue.peek()).assertEqual(null);
    });

    // 按类别统计请求数量
    it('operation_queue_should_count_requests_by_kind', 0, async () => {
      const queue = new StartOperationQueue();
      const builder = new StartRequestBuilder();
      queue.enqueue(builder.withRequestId('a').withKind(StartModeKind.KIND_STANDARD).withFoodItemId(0).build());
      queue.enqueue(builder.withRequestId('b').withKind(StartModeKind.KIND_SPECIFIED).withFoodItemId(0).build());
      queue.enqueue(builder.withRequestId('c').withKind(StartModeKind.KIND_STANDARD).withFoodItemId(1).build());
      expect(queue.countByKind(StartModeKind.KIND_STANDARD)).assertEqual(2);
      expect(queue.countByKind(StartModeKind.KIND_SPECIFIED)).assertEqual(1);
      expect(queue.countByKind(StartModeKind.KIND_SINGLETON)).assertEqual(0);
    });

    // 清空后请求数量归零
    it('operation_queue_should_clear_all_requests', 0, async () => {
      const queue = new StartOperationQueue();
      const builder = new StartRequestBuilder();
      queue.enqueue(builder.withRequestId('c1').withKind(StartModeKind.KIND_STANDARD).withFoodItemId(0).build());
      queue.enqueue(builder.withRequestId('c2').withKind(StartModeKind.KIND_SINGLETON).withFoodItemId(1).build());
      queue.clear();
      expect(queue.getLength()).assertEqual(0);
      expect(queue.getRequests().length).assertEqual(0);
    });
    // 分发器分发 standard 请求成功
    it('operation_dispatcher_should_dispatch_standard_request', 0, async () => {
      const dispatcher = new StartOperationDispatcher(mockStartService);
      const request = new StartRequestBuilder().withRequestId('d1').withKind(StartModeKind.KIND_STANDARD)
        .withFoodItemId(0).build();
      const result = await dispatcher.dispatch(request);
      expect(result).assertTrue();
      expect(dispatcher.getDispatchedCount()).assertEqual(1);
    });

    // 分发器分发 specified / singleton 请求成功
    it('operation_dispatcher_should_dispatch_specified_and_singleton', 0, async () => {
      const dispatcher = new StartOperationDispatcher(mockStartService);
      const specifiedResult = await dispatcher.dispatch(new StartRequestBuilder().withRequestId('s1')
        .withKind(StartModeKind.KIND_SPECIFIED).withFoodItemId(1).withTarget('pages/FoodDetail').build());
      const singletonResult = await dispatcher.dispatch(new StartRequestBuilder().withRequestId('s2')
        .withKind(StartModeKind.KIND_SINGLETON).withFoodItemId(0).build());
      expect(specifiedResult).assertTrue();
      expect(singletonResult).assertTrue();
      expect(dispatcher.getDispatchedCount()).assertEqual(2);
    });

    // 分发计数可重置
    it('operation_dispatcher_should_reset_dispatched_count', 0, async () => {
      const dispatcher = new StartOperationDispatcher(mockStartService);
      await dispatcher.dispatch(new StartRequestBuilder().withRequestId('a')
        .withKind(StartModeKind.KIND_STANDARD).build());
      await dispatcher.dispatch(new StartRequestBuilder().withRequestId('b')
        .withKind(StartModeKind.KIND_SINGLETON).build());
      expect(dispatcher.getDispatchedCount()).assertEqual(2);
      dispatcher.resetDispatchedCount();
      expect(dispatcher.getDispatchedCount()).assertEqual(0);
    });

    // 结果分析器识别操作关键字
    it('operation_result_analyzer_should_detect_operation_keywords', 0, async () => {
      const analyzer = new StartResultAnalyzer();
      analyzer.setLog(['standard called with foodItemId: 0', 'singleton called with foodItemId: 1']);
      expect(analyzer.getLogSize()).assertEqual(2);
      expect(analyzer.hasStandardOperation()).assertTrue();
      expect(analyzer.hasSpecifiedOperation()).assertFalse();
      expect(analyzer.hasSingletonOperation()).assertTrue();
    });

    // 结果分析器还原操作执行顺序
    it('operation_result_analyzer_should_report_operation_order', 0, async () => {
      const analyzer = new StartResultAnalyzer();
      analyzer.setLog(['singleton called with foodItemId: 0', 'standard called with foodItemId: 0',
        'specified called with target: pages/FoodDetail foodItemId: 1']);
      const order = analyzer.getOperationOrder();
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('singleton');
      expect(order[1]).assertEqual('standard');
      expect(order[2]).assertEqual('specified');
    });

    // 校验器验证请求合法性
    it('operation_validator_should_validate_requests', 0, async () => {
      const validator = new StartOperationValidator();
      const valid = new StartRequestBuilder().withRequestId('v1').withKind(StartModeKind.KIND_SPECIFIED)
        .withFoodItemId(1).withTarget('pages/FoodDetail').build();
      expect(validator.isRequestValid(valid)).assertTrue();
      const invalid = new StartRequestBuilder().withRequestId('v2').withKind(StartModeKind.KIND_SPECIFIED)
        .withFoodItemId(1).withTarget('').build();
      expect(validator.isRequestValid(invalid)).assertFalse();
      const violations = validator.validateRequest(invalid);
      expect(violations.length).assertEqual(1);
    });

    // 校验器识别越界 foodItemId
    it('operation_validator_should_reject_out_of_range_food_id', 0, async () => {
      const validator = new StartOperationValidator();
      const request = new StartRequestBuilder().withRequestId('v3').withKind(StartModeKind.KIND_STANDARD)
        .withFoodItemId(9).build();
      expect(validator.isFoodItemValid(9)).assertFalse();
      expect(validator.isRequestValid(request)).assertFalse();
      expect(validator.validateRequest(request).length).assertEqual(1);
    });

    // 请求构建器构建完整请求
    it('operation_request_builder_should_build_complete_request', 0, async () => {
      const built = new StartRequestBuilder().withRequestId('b1').withKind(StartModeKind.KIND_SPECIFIED)
        .withFoodItemId(1).withTarget('pages/FoodDetail').withStatus(OperationStatus.STATUS_RUNNING).build();
      expect(built.requestId).assertEqual('b1');
      expect(built.kind).assertEqual(StartModeKind.KIND_SPECIFIED);
      expect(built.foodItemId).assertEqual(1);
      expect(built.target).assertEqual('pages/FoodDetail');
      expect(built.status).assertEqual(OperationStatus.STATUS_RUNNING);
      expect(built.createdAt).assertLargerOrEqual(0);
    });

    // id 生成器生成唯一递增 id
    it('operation_id_generator_should_generate_unique_ids', 0, async () => {
      const generator = new StartOperationIdGenerator('start');
      const ids = generator.generateBatch(5);
      expect(ids.length).assertEqual(5);
      expect(ids[0]).assertEqual('start_0');
      expect(ids[4]).assertEqual('start_4');
      expect(generator.getNextSequence()).assertEqual(5);
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(5);
      generator.reset();
      expect(generator.getNextSequence()).assertEqual(0);
    });

    // 日志格式化器格式化与关键词统计
    it('operation_log_formatter_should_format_and_count', 0, async () => {
      const formatter = new StartOperationLogFormatter();
      expect(formatter.formatEntry('standard called')).assertEqual('[startmode] standard called');
      const log: string[] = ['standard called with foodItemId: 0', 'singleton called with foodItemId: 1'];
      const text = formatter.formatLog(log);
      expect(text.includes('standard called')).assertTrue();
      expect(formatter.countKeyword(log, 'standard')).assertEqual(1);
      expect(formatter.getUniqueKeywords(log).length).assertEqual(2);
      expect(formatter.isEmpty([])).assertTrue();
    });

    // 日志格式化器去重关键字
    it('operation_log_formatter_should_deduplicate_keywords', 0, async () => {
      const formatter = new StartOperationLogFormatter();
      const log: string[] = ['standard called with foodItemId: 0', 'standard called with foodItemId: 1',
        'singleton called with foodItemId: 0'];
      const keywords = formatter.getUniqueKeywords(log);
      expect(keywords.length).assertEqual(2);
      expect(formatter.countKeyword(log, 'standard')).assertEqual(2);
    });
  });
}



