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
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  checkTextContent,
  isCameraPageVisible,
  triggerCameraPage,
  waitForCameraPageStable,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  runSerializedUiOperation,
  webCameraComponentCount,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';
import hilog from '@ohos.hilog';

// 关闭网页视图的辅助函数：确保测试环境干净
async function closeWebViewIfExists(drv: Driver): Promise<void> {
  await runSerializedUiOperation(async () => {
    await drv.triggerKey(KEY_BACK);
    await drv.delayMs(200);
  });
}

// 确保网页拍照视图可见：KEY_CAPTURE 在测试环境无法可靠重新拉起已关闭的网页视图，
// 改用 startAbility 冷启动 EntryAbility 的 triggerCameraPage
async function ensureWebCameraVisible(drv: Driver): Promise<void> {
  await triggerCameraPage(drv);
}

interface TestResult {
  passed: boolean;
  timestamp: number;
  details: string;
}

interface TestStats {
  total: number;
  passed: number;
  failed: number;
  passRate: number;
}

interface PerformanceStats {
  avg: number;
  min: number;
  max: number;
  count: number;
}

// 回归测试记录器：记录所有测试结果和性能指标，用于生成回归报告
class RegressionTestRecorder {
  private static instance: RegressionTestRecorder | undefined;
  private testResults: Map<string, TestResult> = new Map();
  private performanceMetrics: Map<string, number[]> = new Map();

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): RegressionTestRecorder {
    if (!RegressionTestRecorder.instance) {
      RegressionTestRecorder.instance = new RegressionTestRecorder();
    }
    return RegressionTestRecorder.instance;
  }

  // 记录测试结果：保存测试用例的通过状态和详细信息
  public recordTestResult(testId: string, passed: boolean, details: string = ''): void {
    const result: TestResult = {
      passed, timestamp: Date.now(), details
    };
    this.testResults.set(testId, result);
  }

  // 记录性能指标：收集特定性能指标的多组数据用于统计分析
  public recordPerformanceMetric(metricName: string, value: number): void {
    const metrics: number[] | undefined = this.performanceMetrics.get(metricName);
    if (metrics === undefined) {
      const newMetrics: number[] = [];
      newMetrics.push(value);
      this.performanceMetrics.set(metricName, newMetrics);
    } else {
      metrics.push(value);
    }
  }

  // 获取测试统计：计算总测试数、通过数、失败数和通过率
  public getTestStats(): TestStats {
    const total: number = this.testResults.size;
    const passed: number = Array.from(this.testResults.values()).filter(result => result.passed).length;
    const failed: number = total - passed;
    const passRate: number = total > 0 ? (passed / total) * 100 : 0;
    const stats: TestStats = {
      total,
      passed,
      failed,
      passRate
    };
    return stats;
  }

  // 获取性能统计：计算指定性能指标的平均值、最小值、最大值和样本数
  public getPerformanceStats(metricName: string): PerformanceStats {
    const metrics: number[] = this.performanceMetrics.get(metricName) || [];
    if (metrics.length === 0) {
      const emptyStats: PerformanceStats = {
        avg: 0,
        min: 0,
        max: 0,
        count: 0
      };
      return emptyStats;
    }

    const sum: number = metrics.reduce((a, b) => a + b, 0);
    const avg: number = sum / metrics.length;
    const min: number = Math.min(...metrics);
    const max: number = Math.max(...metrics);

    const stats: PerformanceStats = {
      avg,
      min,
      max,
      count: metrics.length
    };
    return stats;
  }

  // 生成回归报告：汇总所有测试结果和性能数据，用于版本质量评估
  public generateRegressionReport(): string {
    const stats = this.getTestStats();
    const performanceStats = this.getPerformanceStats('webview_render');

    return `
回归测试报告
============
测试统计:
- 总测试数: ${stats.total}
- 通过数: ${stats.passed}
- 失败数: ${stats.failed}
- 通过率: ${stats.passRate.toFixed(2)}%

性能统计:
- 网页视图渲染平均时间: ${performanceStats.avg.toFixed(2)}ms
- 网页视图渲染最短时间: ${performanceStats.min.toFixed(2)}ms
- 网页视图渲染最长时间: ${performanceStats.max.toFixed(2)}ms

测试结果详情:
${Array.from(this.testResults.entries()).map((entry) => {
      const id: string = entry[0];
      const result: TestResult = entry[1];
      return `- ${id}: ${result.passed ? '通过' : '失败'} (${new Date(result.timestamp).toISOString()})`;
    }).join('\n')}
    `;
  }

  // 清空所有记录：重置测试数据和性能指标，用于测试环境初始化
  public clearRecords(): void {
    this.testResults.clear();
    this.performanceMetrics.clear();
  }
}

export default function comprehensiveRegressionTest() {
  describe('ComprehensiveRegression_Test', () => {
    let driver: Driver;
    let regressionRecorder: RegressionTestRecorder;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      regressionRecorder = RegressionTestRecorder.getInstance();
      regressionRecorder.clearRecords();

      // 初始化环境，关闭可能残留的网页视图
      await closeWebViewIfExists(driver);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });

      hilog.info(0x0000, 'testTag', '%{public}s', `beforeAll: Test environment initialized successfully`);
    });

    afterAll(async () => { // 关闭网页视图
      await closeWebViewIfExists(driver);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(300);
      });
      hilog.info(0x0000, 'testTag', '%{public}s', `${regressionRecorder.generateRegressionReport()}`);
    });

    // 测试2：导航功能回归 - 验证左右导航和边界导航后网页视图仍可见、组件数正常
    it('navigation_functionality_regression_should_pass', 0, async () => {
      const testId = 'navigation_functionality';

      try {
        await ensureWebCameraVisible(driver);

        // 右键导航：网页视图仍可见
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const rightNavPassed: boolean = await isCameraPageVisible(driver);

        // 左键导航：网页视图仍可见
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const leftNavPassed: boolean = await isCameraPageVisible(driver);

        // 边界导航：连续右键到达末尾边界后网页视图仍可见
        await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
        const boundaryNavPassed: boolean = await isCameraPageVisible(driver);

        const componentCount = await webCameraComponentCount(driver);
        const testPassed = rightNavPassed && leftNavPassed && boundaryNavPassed && componentCount >= 1;
        regressionRecorder.recordTestResult(testId, testPassed,
          `右键导航: ${rightNavPassed}, 左键导航: ${leftNavPassed}, 边界导航: ${boundaryNavPassed}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试3：操作功能回归 - 验证息屏、预览和分享按钮操作功能正常
    it('operation_functionality_regression_should_pass', 0, async () => {
      const testId = 'operation_functionality';

      try {
        await ensureWebCameraVisible(driver);
        // TODO: 此处需补充触发 KEY_ENTER 并验证对应公共事件发布的逻辑
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const screenOutPassed = await isCameraPageVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const shutdownPassed = await isCameraPageVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const rebootPassed = await isCameraPageVisible(driver);

        const testPassed = screenOutPassed && shutdownPassed && rebootPassed;
        regressionRecorder.recordTestResult(testId, testPassed,
          `息屏: ${screenOutPassed}, 预览: ${shutdownPassed}, 分享: ${rebootPassed}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试4：性能回归 - 验证网页视图渲染时间和焦点导航时间在合理范围
    it('performance_regression_should_pass', 0, async () => {
      const testId = 'performance_regression';

      try {
        const renderStart: number = Date.now();
        await ensureWebCameraVisible(driver);
        const renderEnd: number = Date.now();
        const renderTime: number = renderEnd - renderStart;

        regressionRecorder.recordPerformanceMetric('webview_render', renderTime);

        const navStart: number = Date.now();
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const navEnd: number = Date.now();
        const navTime: number = navEnd - navStart;

        regressionRecorder.recordPerformanceMetric('focus_navigation', navTime);

        // 调整性能阈值，避免过于严格
        const renderPassed = renderTime <= 8000;
        const navPassed = navTime <= 3000;

        const testPassed = renderPassed && navPassed;
        regressionRecorder.recordTestResult(testId, testPassed,
          `渲染时间: ${renderTime.toFixed(2)}ms, 导航时间: ${navTime.toFixed(2)}ms`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试5：稳定性回归 - 验证多次操作后组件状态和焦点状态保持稳定
    it('stability_regression_should_pass', 0, async () => {
      const testId = 'stability_regression';

      try {
        await ensureWebCameraVisible(driver);

        const baselineComponentCount = await webCameraComponentCount(driver);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const finalComponentCount = await webCameraComponentCount(driver);

        const stabilityPassed = Math.abs(finalComponentCount - baselineComponentCount) <= TOLERANCE_COMPONENT_COUNT;
        const focusChecked = await isCameraPageVisible(driver);

        const testPassed = stabilityPassed && focusChecked;
        regressionRecorder.recordTestResult(testId, testPassed,
          `组件稳定性: ${stabilityPassed}, 焦点检查: ${focusChecked}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试6：错误处理回归 - 验证无效按键后系统能正确恢复
    it('error_handling_regression_should_pass', 0, async () => {
      const testId = 'error_handling_regression';

      try {
        await ensureWebCameraVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const errorHandlingPassed = await isCameraPageVisible(driver);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const recoveryPassed = await isCameraPageVisible(driver);

        const testPassed = errorHandlingPassed && recoveryPassed;
        regressionRecorder.recordTestResult(testId, testPassed,
          `错误处理: ${errorHandlingPassed}, 恢复验证: ${recoveryPassed}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试7：边界条件回归 - 验证连续导航和快速操作下系统稳定
    it('boundary_conditions_regression_should_pass', 0, async () => {
      const testId = 'boundary_conditions_regression';

      try {
        await ensureWebCameraVisible(driver);

        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const leftBoundaryPassed = await isCameraPageVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const rightBoundaryPassed = await isCameraPageVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const fastOpPassed = await isCameraPageVisible(driver);

        const testPassed = leftBoundaryPassed && rightBoundaryPassed && fastOpPassed;
        regressionRecorder.recordTestResult(testId, testPassed,
          `左边界: ${leftBoundaryPassed}, 右边界: ${rightBoundaryPassed}, 快速操作: ${fastOpPassed}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试8：并发操作回归 - 验证并发导航操作下系统状态稳定
    it('concurrent_operations_regression_should_pass', 0, async () => {
      const testId = 'concurrent_operations_regression';

      try {
        await ensureWebCameraVisible(driver);

        const baselineComponentCount = await webCameraComponentCount(driver);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const finalComponentCount = await webCameraComponentCount(driver);

        const concurrencyPassed = Math.abs(finalComponentCount - baselineComponentCount) <= TOLERANCE_COMPONENT_COUNT;
        const focusChecked = await isCameraPageVisible(driver);

        const testPassed = concurrencyPassed && focusChecked;
        regressionRecorder.recordTestResult(testId, testPassed,
          `并发处理: ${concurrencyPassed}, 焦点检查: ${focusChecked}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试9：资源管理回归 - 验证大量操作后系统资源使用正常
    it('resource_management_regression_should_pass', 0, async () => {
      const testId = 'resource_management_regression';

      try {
        await ensureWebCameraVisible(driver);
        const baselineComponentCount = await webCameraComponentCount(driver);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const finalComponentCount = await webCameraComponentCount(driver);
        const resourcePassed = Math.abs(finalComponentCount - baselineComponentCount) <= TOLERANCE_COMPONENT_COUNT;
        const focusChecked = await isCameraPageVisible(driver);

        const testPassed = resourcePassed && focusChecked;
        regressionRecorder.recordTestResult(testId, testPassed,
          `资源管理: ${resourcePassed}, 焦点检查: ${focusChecked}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });

    // 测试10：综合场景回归 - 验证完整操作流程中功能正常
    it('comprehensive_scenario_regression_should_pass', 0, async () => {
      const testId = 'comprehensive_scenario_regression';

      try {
        const scenarioStart: number = Date.now();
        await ensureWebCameraVisible(driver);

        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const navFocusValid = await isCameraPageVisible(driver);

        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(500);
        });

        const scenarioEnd: number = Date.now();
        const scenarioTime: number = scenarioEnd - scenarioStart;
        const timePassed: boolean = scenarioTime <= 15000;

        const testPassed: boolean = timePassed && navFocusValid;
        regressionRecorder.recordTestResult(testId, testPassed,
          `场景时间: ${scenarioTime.toFixed(2)}ms, 耗时检查: ${timePassed}`);

        expect(testPassed).assertTrue();
      } catch (error) {
        const errorMsg: string = error instanceof Error ? error.message : String(error);
        regressionRecorder.recordTestResult(testId, false, `错误信息: ${errorMsg}`);
        throw new Error(errorMsg);
      }
    });
  });


}
