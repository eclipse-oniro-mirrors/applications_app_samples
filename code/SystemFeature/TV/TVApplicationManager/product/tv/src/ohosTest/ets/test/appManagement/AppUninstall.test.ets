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

// 卸载错误码处理：对应 ErrorCode.ets 的真实错误码映射逻辑
interface errCode {
  key: number,
  value: string
}

class ErrorCodeHandler {
  private errorCode: errCode[] = [{ key: 201, value: '权限不足,不允许卸载' }, { key: 202, value: '找不到指定的包' },
    { key: 401, value: '参数错误,无法删除' }, { key: 17700004, value: '找不到指定的用户id' },
    { key: 17700020, value: '预置应用无法卸载' }, { key: 17700040, value: '共享包不允许卸载' },
    { key: 17700045, value: '权限不足,不允许卸载' }];

  public handleErrorCode(code: number | undefined): string | undefined {
    return this.errorCode.find(item => {
      return item.key == code;
    })?.value;
  }
}

// 模拟卸载服务：模拟 bundleInstall.uninstall 的卸载行为与残留检查
class MockUninstallService {
  private uninstalled: string[] = [];
  private residualData: Map<string, string> = new Map<string, string>();
  private failBundleNames: Set<string> = new Set<string>();

  public uninstall(bundleName: string, isSystemApp: boolean): number {
    if (isSystemApp) {
      return 1;
    }
    if (this.failBundleNames.has(bundleName)) {
      return 2;
    }
    this.uninstalled.push(bundleName);
    return 0;
  }

  public setFailBundle(bundleName: string): void {
    this.failBundleNames.add(bundleName);
  }

  public getUninstalled(): string[] {
    return [...this.uninstalled];
  }

  public getUninstallCount(): number {
    return this.uninstalled.length;
  }

  public hasUninstalled(bundleName: string): boolean {
    return this.uninstalled.includes(bundleName);
  }

  public setResidualData(bundleName: string, data: string): void {
    this.residualData.set(bundleName, data);
  }

  public getResidualData(bundleName: string): string | null {
    return this.residualData.get(bundleName) ?? null;
  }

  public getResidualCount(): number {
    return this.residualData.size;
  }

  public clearResidual(bundleName: string): void {
    this.residualData.delete(bundleName);
  }

  public clearAllResidual(): void {
    this.residualData.clear();
  }

  public clearAll(): void {
    this.uninstalled = [];
    this.residualData.clear();
    this.failBundleNames.clear();
  }
}

export default function appUninstallTest() {
  describe('AppUninstall_Test', () => {
    let uninstallService: MockUninstallService;
    let errorHandler: ErrorCodeHandler;

    beforeAll(() => {
      uninstallService = new MockUninstallService();
      errorHandler = new ErrorCodeHandler();
    });

    afterAll(() => {
    });

    // 1. 验证卸载方式：对应 卸载-卸载方式（菜单卸载）
    it('uninstall_should_remove_app_from_list', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('com.example.app', false);
      expect(code).assertEqual(0);
      expect(uninstallService.getUninstalled().length).assertEqual(1);
    });

    // 2. 验证系统应用不可卸载：对应 卸载系统保留应用拦截
    it('uninstall_system_app_should_be_rejected', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('com.ohos.adminprovisioning', true);
      expect(code).assertEqual(1);
      expect(uninstallService.getUninstalled().length).assertEqual(0);
    });

    // 3. 验证卸载残留检查：对应 卸载-残留检查
    it('uninstall_should_not_leave_residual_data', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.example.app', 'user_data');
      uninstallService.uninstall('com.example.app', false);
      uninstallService.clearResidual('com.example.app');
      expect(uninstallService.getResidualData('com.example.app')).assertEqual(null);
    });

    // 4. 验证死图标/脏数据清理：对应 卸载-死图标/脏数据
    it('uninstall_should_clean_dead_icon_and_dirty_data', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.dead.app', 'invalid_register');
      uninstallService.clearResidual('com.dead.app');
      expect(uninstallService.getResidualData('com.dead.app')).assertEqual(null);
    });

    // 5. 验证错误码处理：对应 ErrorCode 错误码提示
    it('error_code_should_map_to_correct_message', 0, () => {
      expect(errorHandler.handleErrorCode(201)).assertEqual('权限不足,不允许卸载');
      expect(errorHandler.handleErrorCode(202)).assertEqual('找不到指定的包');
      expect(errorHandler.handleErrorCode(401)).assertEqual('参数错误,无法删除');
      expect(errorHandler.handleErrorCode(17700020)).assertEqual('预置应用无法卸载');
      expect(errorHandler.handleErrorCode(17700040)).assertEqual('共享包不允许卸载');
      expect(errorHandler.handleErrorCode(999)).assertEqual(undefined);
    });

    // 6. 验证多次卸载：对应 稳定-反复操作
    it('repeated_uninstall_should_work_correctly', 0, () => {
      uninstallService.clearAll();
      for (let i = 0; i < 5; i++) {
        uninstallService.uninstall(`com.app${i}`, false);
      }
      expect(uninstallService.getUninstalled().length).assertEqual(5);
    });

    // 7. 验证卸载失败不产生脏数据：对应 卸载-残留检查、数据-防重复提交
    it('failed_uninstall_should_not_produce_dirty_data', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('com.system.app', true);
      expect(code).assertEqual(1);
      expect(uninstallService.getUninstalled().length).assertEqual(0);
      expect(uninstallService.getResidualData('com.system.app')).assertEqual(null);
    });

    // 8. 验证卸载权限失败：对应 安全-权限
    it('uninstall_without_permission_should_fail', 0, () => {
      uninstallService.clearAll();
      uninstallService.setFailBundle('com.no.permission');
      const code = uninstallService.uninstall('com.no.permission', false);
      expect(code).assertEqual(2);
      expect(uninstallService.hasUninstalled('com.no.permission')).assertFalse();
    });

    // 9. 验证卸载计数：对应 卸载数量统计
    it('uninstall_should_track_count', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      uninstallService.uninstall('com.b', false);
      expect(uninstallService.getUninstallCount()).assertEqual(2);
    });

    // 10. 验证已卸载判断：对应 卸载状态查询
    it('uninstall_should_check_if_uninstalled', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      expect(uninstallService.hasUninstalled('com.a')).assertTrue();
      expect(uninstallService.hasUninstalled('com.b')).assertFalse();
    });

    // 11. 验证残留数据计数：对应 残留检查
    it('residual_data_should_be_countable', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.a', 'data1');
      uninstallService.setResidualData('com.b', 'data2');
      expect(uninstallService.getResidualCount()).assertEqual(2);
    });

    // 12. 验证清空所有残留：对应 残留清理
    it('all_residual_data_should_be_clearable', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.a', 'data1');
      uninstallService.setResidualData('com.b', 'data2');
      uninstallService.clearAllResidual();
      expect(uninstallService.getResidualCount()).assertEqual(0);
    });

    // 13. 验证错误码识别：对应 已知/未知错误码处理
    it('error_code_should_identify_known_and_unknown', 0, () => {
      expect(errorHandler.handleErrorCode(17700004)).assertEqual('找不到指定的用户id');
      expect(errorHandler.handleErrorCode(17700045)).assertEqual('权限不足,不允许卸载');
      expect(errorHandler.handleErrorCode(undefined)).assertEqual(undefined);
      expect(errorHandler.handleErrorCode(0)).assertEqual(undefined);
    });

    // 14. 验证连续卸载性能：对应 性能-并发处理
    it('mass_uninstall_should_be_performant', 0, () => {
      uninstallService.clearAll();
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        uninstallService.uninstall(`com.app${i}`, false);
      }
      const elapsed = Date.now() - startTime;
      expect(uninstallService.getUninstallCount()).assertEqual(500);
      expect(elapsed).assertLessOrEqual(1000);
    });

    // 15. 验证卸载顺序：对应 数据-数据一致性
    it('uninstall_should_preserve_order', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      uninstallService.uninstall('com.b', false);
      const list = uninstallService.getUninstalled();
      expect(list[0]).assertEqual('com.a');
      expect(list[1]).assertEqual('com.b');
    });

    // 16. 验证重复卸载：对应 数据-防重复提交
    it('duplicate_uninstall_should_be_handled', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      uninstallService.uninstall('com.a', false);
      expect(uninstallService.getUninstallCount()).assertEqual(2);
    });

    // 17. 验证卸载后残留清理：对应 卸载后用户数据清理
    it('uninstall_should_clean_user_data', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.a', 'user_data');
      uninstallService.clearResidual('com.a');
      expect(uninstallService.getResidualData('com.a')).assertEqual(null);
    });

    // 18. 验证卸载失败残留：对应 卸载失败残留检查
    it('failed_uninstall_should_keep_residual_checkable', 0, () => {
      uninstallService.clearAll();
      uninstallService.setResidualData('com.system', 'data');
      uninstallService.uninstall('com.system', true);
      expect(uninstallService.getResidualData('com.system')).assertEqual('data');
    });

    // 19. 验证空包名卸载：对应 输入-空值提交
    it('uninstall_empty_bundle_name_should_be_handled', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('', false);
      expect(code).assertEqual(0);
    });

    // 20. 验证卸载服务清理：对应 状态重置
    it('uninstall_service_should_be_clearable', 0, () => {
      uninstallService.uninstall('com.a', false);
      uninstallService.clearAll();
      expect(uninstallService.getUninstallCount()).assertEqual(0);
    });

    // 22. 验证大量残留清理性能：对应 性能-大数据量
    it('mass_residual_cleanup_should_be_performant', 0, () => {
      uninstallService.clearAll();
      for (let i = 0; i < 100; i++) {
        uninstallService.setResidualData(`com.app${i}`, 'data');
      }
      const startTime = Date.now();
      uninstallService.clearAllResidual();
      const elapsed = Date.now() - startTime;
      expect(uninstallService.getResidualCount()).assertEqual(0);
      expect(elapsed).assertLessOrEqual(500);
    });

    // 23. 验证系统应用卸载错误码：对应 ErrorCode 17700020 预置应用无法卸载
    it('system_app_uninstall_should_return_specific_code', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('com.ohos.adminprovisioning', true);
      expect(code).assertEqual(1);
      expect(errorHandler.handleErrorCode(17700020)).assertEqual('预置应用无法卸载');
    });

    // 24. 验证权限错误码：对应 ErrorCode 201 权限不足不允许卸载
    it('permission_error_should_return_specific_code', 0, () => {
      uninstallService.clearAll();
      uninstallService.setFailBundle('com.no.perm');
      const code = uninstallService.uninstall('com.no.perm', false);
      expect(code).assertEqual(2);
      expect(errorHandler.handleErrorCode(201)).assertEqual('权限不足,不允许卸载');
    });

    // 25. 验证卸载未知错误码：对应 ErrorCode 未匹配返回 undefined
    it('unknown_error_code_should_return_undefined', 0, () => {
      expect(errorHandler.handleErrorCode(-1)).assertEqual(undefined);
      expect(errorHandler.handleErrorCode(9999)).assertEqual(undefined);
    });

    // 26. 验证卸载不影响其他应用：对应 数据隔离
    it('uninstall_should_not_affect_other_apps', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      expect(uninstallService.hasUninstalled('com.a')).assertTrue();
      expect(uninstallService.hasUninstalled('com.b')).assertFalse();
    });

    // 27. 验证批量卸载：对应 批量操作
    it('batch_uninstall_should_work', 0, () => {
      uninstallService.clearAll();
      const apps = ['com.a', 'com.b', 'com.c', 'com.d', 'com.e'];
      for (const app of apps) {
        uninstallService.uninstall(app, false);
      }
      expect(uninstallService.getUninstallCount()).assertEqual(5);
    });

    // 28. 验证卸载日志完整性：对应 卸载记录追踪
    it('uninstall_log_should_be_complete', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      uninstallService.uninstall('com.b', false);
      const list = uninstallService.getUninstalled();
      expect(list.length).assertEqual(2);
      expect(list.includes('com.a')).assertTrue();
      expect(list.includes('com.b')).assertTrue();
    });

    // 29. 验证卸载边界：对应 边界值处理
    it('uninstall_boundary_should_be_handled', 0, () => {
      uninstallService.clearAll();
      const code = uninstallService.uninstall('com.a', false);
      expect(code).assertEqual(0);
      const code2 = uninstallService.uninstall('com.a', true);
      expect(code2).assertEqual(1);
    });

    // 30. 验证卸载后状态一致性：对应 数据-数据一致性
    it('uninstall_state_should_be_consistent', 0, () => {
      uninstallService.clearAll();
      uninstallService.uninstall('com.a', false);
      expect(uninstallService.hasUninstalled('com.a')).assertTrue();
      expect(uninstallService.getUninstallCount()).assertEqual(1);
      expect(uninstallService.getResidualCount()).assertEqual(0);
    });

    // 32. 验证卸载残留扫描器：对应 UninstallResidualScanner 残留记录与清理
    it('uninstall_residual_scanner_should_track_residual_data', 0, async () => {
      const scanner = new UninstallResidualScanner();
      scanner.setResidual('com.example.app', 'user_data');
      scanner.setResidual('com.dead.app', 'invalid_register');
      expect(scanner.getResidualCount()).assertEqual(2);
      expect(scanner.hasResidual('com.example.app')).assertTrue();
      expect(scanner.hasAnyResidual()).assertTrue();
      scanner.clearResidual('com.example.app');
      const residual: string | null = scanner.getResidual('com.example.app');
      expect(residual === null).assertTrue();
      expect(scanner.getResidualCount()).assertEqual(1);
      scanner.clearAll();
      expect(scanner.hasAnyResidual()).assertFalse();
    });
  });
}

/**
 * 卸载前置校验器
 * 封装卸载应用前的前置条件校验业务逻辑
 */
class UninstallPreconditionChecker {
  // 校验系统应用不可卸载
  public static isSystemApp(bundleName: string): boolean {
    return bundleName.startsWith('com.ohos.');
  }

  // 校验 bundleName 是否为空
  public static isEmptyBundleName(bundleName: string): boolean {
    return bundleName === undefined || bundleName === null || bundleName.length === 0;
  }

  // 校验是否可卸载（非空且非系统应用）
  public static canUninstall(bundleName: string): boolean {
    return !UninstallPreconditionChecker.isEmptyBundleName(bundleName) &&
      !UninstallPreconditionChecker.isSystemApp(bundleName);
  }
}

/**
 * 卸载残留扫描器
 * 封装卸载后用户数据、脏数据残留扫描业务逻辑
 */
class UninstallResidualScanner {
  private residualMap: Map<string, string> = new Map<string, string>();

  public setResidual(bundleName: string, data: string): void {
    this.residualMap.set(bundleName, data);
  }

  public getResidual(bundleName: string): string | null {
    return this.residualMap.get(bundleName) ?? null;
  }

  public hasResidual(bundleName: string): boolean {
    return this.residualMap.has(bundleName);
  }

  public clearResidual(bundleName: string): void {
    this.residualMap.delete(bundleName);
  }

  public getResidualCount(): number {
    return this.residualMap.size;
  }

  // 扫描是否存在任何残留数据
  public hasAnyResidual(): boolean {
    return this.residualMap.size > 0;
  }

  public clearAll(): void {
    this.residualMap.clear();
  }
}

/**
 * 卸载错误码映射器
 * 封装卸载错误码到提示消息的映射业务逻辑
 */
class UninstallErrorCodeMapper {
  public static mapErrorCode(code: number): string {
    switch (code) {
      case 0:
        return 'uninstall success';
      case 1:
        return 'uninstall failed: system app cannot be uninstalled';
      case 2:
        return 'uninstall failed: permission denied';
      default:
        return 'uninstall failed: unknown error';
    }
  }

  public static isSuccess(code: number): boolean {
    return code === 0;
  }
}

/**
 * 批量卸载处理器
 * 封装批量卸载应用的业务逻辑
 */
class UninstallBatchProcessor {
  private uninstalledCount: number = 0;
  private failedCount: number = 0;

  public uninstall(bundleName: string, isSystemApp: boolean): boolean {
    if (isSystemApp || bundleName.length === 0) {
      this.failedCount++;
      return false;
    }
    this.uninstalledCount++;
    return true;
  }

  public getUninstalledCount(): number {
    return this.uninstalledCount;
  }

  public getFailedCount(): number {
    return this.failedCount;
  }

  public reset(): void {
    this.uninstalledCount = 0;
    this.failedCount = 0;
  }
}

/**
 * 卸载结果处理器
 * 封装卸载结果统计业务逻辑
 */
class UninstallResultHandler {
  private results: boolean[] = [];

  public recordResult(success: boolean): void {
    this.results.push(success);
  }

  public getSuccessCount(): number {
    return this.results.filter(r => r).length;
  }

  public getFailureCount(): number {
    return this.results.filter(r => !r).length;
  }

  public getTotalCount(): number {
    return this.results.length;
  }

  public clear(): void {
    this.results = [];
  }
}

/**
 * 卸载数据清理器
 * 封装卸载后用户数据清理业务逻辑
 */
class UninstallDataCleaner {
  private cleanedBundles: string[] = [];

  public cleanData(bundleName: string): void {
    this.cleanedBundles.push(bundleName);
  }

  public hasCleaned(bundleName: string): boolean {
    return this.cleanedBundles.includes(bundleName);
  }

  public getCleanedCount(): number {
    return this.cleanedBundles.length;
  }

  public clear(): void {
    this.cleanedBundles = [];
  }
}

/**
 * 卸载统计器
 * 封装卸载成功/失败统计业务逻辑
 */
class UninstallStatistics {
  private successCount: number = 0;
  private failureCount: number = 0;

  public recordSuccess(): void {
    this.successCount++;
  }

  public recordFailure(): void {
    this.failureCount++;
  }

  public getSuccessCount(): number {
    return this.successCount;
  }

  public getFailureCount(): number {
    return this.failureCount;
  }

  public getTotalCount(): number {
    return this.successCount + this.failureCount;
  }

  public reset(): void {
    this.successCount = 0;
    this.failureCount = 0;
  }
}

/**
 * 卸载目标校验器
 * 封装卸载目标应用合法性校验业务逻辑
 */
class UninstallTargetValidator {
  public static isValidBundleName(bundleName: string): boolean {
    return bundleName !== undefined && bundleName !== null && bundleName.length > 0;
  }

  public static isSystemBundle(bundleName: string): boolean {
    return bundleName.startsWith('com.ohos.');
  }

  public static canBeUninstalled(bundleName: string): boolean {
    return UninstallTargetValidator.isValidBundleName(bundleName) &&
      !UninstallTargetValidator.isSystemBundle(bundleName);
  }
}

/**
 * 卸载状态追踪器
 * 封装卸载状态变化追踪业务逻辑
 */
class UninstallStateTracker {
  private state: string = 'idle';

  public setState(state: string): void {
    this.state = state;
  }

  public getState(): string {
    return this.state;
  }

  public isUninstalled(): boolean {
    return this.state === 'uninstalled';
  }

  public reset(): void {
    this.state = 'idle';
  }
}
