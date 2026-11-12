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

import { describe, it, expect } from '@ohos/hypium';
import { MAX_RETRY_COUNT, buildUrl, RequestTracker, RequestConfig, RequestStatus, DEFAULT_TIMEOUT, createApiConfig, ApiConfig, RenamedUserService, UserService, Product, ProductService } from '../../../main/ets/pages/ModuleSystem';
import { User as CommonUser, Product as CommonProduct } from '../../../main/ets/common/Types';
import { UserService as CommonUserService, ProductService as CommonProductService } from '../../../main/ets/common/Service';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

function transcodeStatus(tracker: RequestTracker, first: RequestStatus, second: RequestStatus): string {
  tracker.setStatus(first);
  const start: string = tracker.getStatus();
  tracker.setStatus(second);
  const end: string = tracker.getStatus();
  return start + '->' + end;
}

function buildUrlMatrix(bases: string[], paths: string[]): string[] {
  const built: string[] = [];
  for (let i = 0; i < bases.length; i++) {
    built.push(buildUrl(bases[i], paths[i]));
  }
  return built;
}

/**
 * pages/ModuleSystem.ets 命名导出、导出列表、重命名导出与再导出契约。
 */
export default function ArkTSModuleSystemTest(): void {
  describe('ArkTSModuleSystemTest', () => {

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testMaxRetryCount0001
     * @tc.name      testMaxRetryCount0001
     * @tc.desc      Verify MAX_RETRY_COUNT is the documented constant 3
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMaxRetryCount0001', 0, () => {
      logBegin('testMaxRetryCount0001');
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(Number.isInteger(MAX_RETRY_COUNT)).assertTrue();
      expect(typeof MAX_RETRY_COUNT).assertEqual('number');
      logEnd('testMaxRetryCount0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testBuildUrlConcatenates0002
     * @tc.name      testBuildUrlConcatenates0002
     * @tc.desc      Verify buildUrl joins base and path by plain concatenation
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testBuildUrlConcatenates0002', 0, () => {
      logBegin('testBuildUrlConcatenates0002');
      expect(buildUrl('https://api.example.com', '/users')).assertEqual('https://api.example.com/users');
      expect(buildUrl('', '/users')).assertEqual('/users');
      expect(buildUrl('https://api.example.com', '')).assertEqual('https://api.example.com');
      logEnd('testBuildUrlConcatenates0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testBuildUrlBothEmpty0003
     * @tc.name      testBuildUrlBothEmpty0003
     * @tc.desc      Verify buildUrl returns an empty string when both parts are empty
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBuildUrlBothEmpty0003', 0, () => {
      logBegin('testBuildUrlBothEmpty0003');
      expect(buildUrl('', '')).assertEqual('');
      expect(buildUrl('', '').length).assertEqual(0);
      expect(buildUrl('', '')).assertEqual('');
      logEnd('testBuildUrlBothEmpty0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testBuildUrlHandlesPaths0004
     * @tc.name      testBuildUrlHandlesPaths0004
     * @tc.desc      Verify buildUrl over a matrix of base/path pairs matches manual concatenation
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBuildUrlHandlesPaths0004', 0, () => {
      logBegin('testBuildUrlHandlesPaths0004');
      const bases: string[] = ['http://a', 'http://b/', '', 'https://x.y'];
      const paths: string[] = ['/p', 'q', '/r', ''];
      const built: string[] = buildUrlMatrix(bases, paths);
      expect(built.length).assertEqual(4);
      expect(built[0]).assertEqual('http://a/p');
      expect(built[1]).assertEqual('http://b/q');
      expect(built[2]).assertEqual('/r');
      expect(built[3]).assertEqual('https://x.y');
      logEnd('testBuildUrlHandlesPaths0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testBuildUrlKeepsDuplicates0005
     * @tc.name      testBuildUrlKeepsDuplicates0005
     * @tc.desc      Verify buildUrl does not normalize separators or collapse duplicates
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testBuildUrlKeepsDuplicates0005', 0, () => {
      logBegin('testBuildUrlKeepsDuplicates0005');
      expect(buildUrl('http://a/', '/p')).assertEqual('http://a//p');
      expect(buildUrl('http://a//', '/p')).assertEqual('http://a///p');
      expect(buildUrl('ab', 'ab')).assertEqual('abab');
      logEnd('testBuildUrlKeepsDuplicates0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestTrackerDefaultsToIdle0006
     * @tc.name      testRequestTrackerDefaultsToIdle0006
     * @tc.desc      Verify a fresh RequestTracker reports the idle status
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerDefaultsToIdle0006', 0, () => {
      logBegin('testRequestTrackerDefaultsToIdle0006');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      expect(typeof tracker.getStatus()).assertEqual('string');
      logEnd('testRequestTrackerDefaultsToIdle0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestTrackerSetLoading0007
     * @tc.name      testRequestTrackerSetLoading0007
     * @tc.desc      Verify setStatus stores the loading state
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerSetLoading0007', 0, () => {
      logBegin('testRequestTrackerSetLoading0007');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      expect(tracker.getStatus() === 'idle').assertFalse();
      logEnd('testRequestTrackerSetLoading0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestTrackerFullCycle0008
     * @tc.name      testRequestTrackerFullCycle0008
     * @tc.desc      Verify idle -> loading -> success -> failed transitions are all visible
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerFullCycle0008', 0, () => {
      logBegin('testRequestTrackerFullCycle0008');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      logEnd('testRequestTrackerFullCycle0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestTrackerOverwriteIsLastWins0009
     * @tc.name      testRequestTrackerOverwriteIsLastWins0009
     * @tc.desc      Verify the most recent setStatus wins
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerOverwriteIsLastWins0009', 0, () => {
      logBegin('testRequestTrackerOverwriteIsLastWins0009');
      const tracker: RequestTracker = new RequestTracker();
      expect(transcodeStatus(tracker, 'success', 'failed')).assertEqual('success->failed');
      expect(tracker.getStatus()).assertEqual('failed');
      expect(transcodeStatus(tracker, 'idle', 'loading')).assertEqual('idle->loading');
      logEnd('testRequestTrackerOverwriteIsLastWins0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestTrackerInstancesIsolated0010
     * @tc.name      testRequestTrackerInstancesIsolated0010
     * @tc.desc      Verify two trackers keep independent status
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerInstancesIsolated0010', 0, () => {
      logBegin('testRequestTrackerInstancesIsolated0010');
      const first: RequestTracker = new RequestTracker();
      const second: RequestTracker = new RequestTracker();
      first.setStatus('success');
      expect(first.getStatus()).assertEqual('success');
      expect(second.getStatus()).assertEqual('idle');
      logEnd('testRequestTrackerInstancesIsolated0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestStatusLiterals0011
     * @tc.name      testRequestStatusLiterals0011
     * @tc.desc      Verify all four RequestStatus literals are accepted and stored verbatim
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRequestStatusLiterals0011', 0, () => {
      logBegin('testRequestStatusLiterals0011');
      const statuses: RequestStatus[] = ['idle', 'loading', 'success', 'failed'];
      const tracker: RequestTracker = new RequestTracker();
      let matched: number = 0;
      for (let i = 0; i < statuses.length; i++) {
        tracker.setStatus(statuses[i]);
        if (tracker.getStatus() === statuses[i]) {
          matched++;
        }
      }
      expect(matched).assertEqual(statuses.length);
      expect(statuses.join(',')).assertEqual('idle,loading,success,failed');
      logEnd('testRequestStatusLiterals0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testDefaultTimeoutValue0012
     * @tc.name      testDefaultTimeoutValue0012
     * @tc.desc      Verify the export-list DEFAULT_TIMEOUT constant is 5000
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testDefaultTimeoutValue0012', 0, () => {
      logBegin('testDefaultTimeoutValue0012');
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      expect(DEFAULT_TIMEOUT > MAX_RETRY_COUNT).assertTrue();
      expect(Number.isInteger(DEFAULT_TIMEOUT)).assertTrue();
      logEnd('testDefaultTimeoutValue0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testCreateApiConfig0013
     * @tc.name      testCreateApiConfig0013
     * @tc.desc      Verify createApiConfig copies the host and applies the default timeout
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testCreateApiConfig0013', 0, () => {
      logBegin('testCreateApiConfig0013');
      const config: ApiConfig = createApiConfig('api.example.com');
      expect(config.host).assertEqual('api.example.com');
      expect(config.timeout).assertEqual(DEFAULT_TIMEOUT);
      expect(config.timeout).assertEqual(5000);
      logEnd('testCreateApiConfig0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testCreateApiConfigEmptyHost0014
     * @tc.name      testCreateApiConfigEmptyHost0014
     * @tc.desc      Verify createApiConfig keeps an empty host rather than substituting a default
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCreateApiConfigEmptyHost0014', 0, () => {
      logBegin('testCreateApiConfigEmptyHost0014');
      const config: ApiConfig = createApiConfig('');
      expect(config.host).assertEqual('');
      expect(config.host.length).assertEqual(0);
      expect(config.timeout).assertEqual(5000);
      logEnd('testCreateApiConfigEmptyHost0014');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testCreateApiConfigInstancesIndependent0015
     * @tc.name      testCreateApiConfigInstancesIndependent0015
     * @tc.desc      Verify two configs from createApiConfig do not share identity
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testCreateApiConfigInstancesIndependent0015', 0, () => {
      logBegin('testCreateApiConfigInstancesIndependent0015');
      const first: ApiConfig = createApiConfig('a');
      const second: ApiConfig = createApiConfig('b');
      expect(first.host).assertEqual('a');
      expect(second.host).assertEqual('b');
      expect(first === second).assertFalse();
      logEnd('testCreateApiConfigInstancesIndependent0015');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRenamedUserService0016
     * @tc.name      testRenamedUserService0016
     * @tc.desc      Verify the renamed export InternalUserService as RenamedUserService works
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testRenamedUserService0016', 0, () => {
      logBegin('testRenamedUserService0016');
      const service: RenamedUserService = new RenamedUserService();
      expect(service.getName()).assertEqual('UserService');
      expect(service.getName().length).assertEqual(11);
      expect(typeof service.getName()).assertEqual('string');
      logEnd('testRenamedUserService0016');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRenamedUserServiceIsStable0017
     * @tc.name      testRenamedUserServiceIsStable0017
     * @tc.desc      Verify the renamed export returns the same value on repeated calls
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRenamedUserServiceIsStable0017', 0, () => {
      logBegin('testRenamedUserServiceIsStable0017');
      const service: RenamedUserService = new RenamedUserService();
      expect(service.getName()).assertEqual(service.getName());
      expect(service.getName()).assertEqual('UserService');
      logEnd('testRenamedUserServiceIsStable0017');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testReexportedUserService0018
     * @tc.name      testReexportedUserService0018
     * @tc.desc      Verify the re-exported UserService behaves like the common one
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testReexportedUserService0018', 0, () => {
      logBegin('testReexportedUserService0018');
      const service: UserService = new UserService();
      const found: CommonUser | null = service.findById(3);
      expect(found === null).assertFalse();
      expect((found as CommonUser).id).assertEqual(3);
      expect((found as CommonUser).name).assertEqual('Alice');
      expect(service.findById(0)).assertNull();
      logEnd('testReexportedUserService0018');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testReexportedMatchesCommon0019
     * @tc.name      testReexportedMatchesCommon0019
     * @tc.desc      Verify ModuleSystem's UserService matches common/Service for a matrix of ids
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testReexportedMatchesCommon0019', 0, () => {
      logBegin('testReexportedMatchesCommon0019');
      const reexported: UserService = new UserService();
      const original: CommonUserService = new CommonUserService();
      const ids: number[] = [-2, 0, 1, 6, 100];
      let matched: number = 0;
      for (let i = 0; i < ids.length; i++) {
        const left: CommonUser | null = reexported.findById(ids[i]);
        const right: CommonUser | null = original.findById(ids[i]);
        if ((left === null) === (right === null) && (left === null || (left as CommonUser).id === (right as CommonUser).id)) {
          matched++;
        }
      }
      expect(matched).assertEqual(ids.length);
      logEnd('testReexportedMatchesCommon0019');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testModuleDefinitionProductService0020
     * @tc.name      testModuleDefinitionProductService0020
     * @tc.desc      Verify the locally declared ProductService returns the product name
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testModuleDefinitionProductService0020', 0, () => {
      logBegin('testModuleDefinitionProductService0020');
      const service: ProductService = new ProductService();
      const product: Product = { id: 2, name: 'Keyboard' };
      expect(service.getName(product)).assertEqual('Keyboard');
      expect(service.getName(product).length).assertEqual(8);
      logEnd('testModuleDefinitionProductService0020');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testModuleProductShapeCompatible0021
     * @tc.name      testModuleProductShapeCompatible0021
     * @tc.desc      Verify ModuleSystem's Product shape is compatible with common/Types Product
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testModuleProductShapeCompatible0021', 0, () => {
      logBegin('testModuleProductShapeCompatible0021');
      const local: Product = { id: 5, name: 'Mouse' };
      const common: CommonProduct = { id: local.id, name: local.name };
      expect(common.id).assertEqual(5);
      expect(common.name).assertEqual('Mouse');
      const commonService: CommonProductService = new CommonProductService();
      expect(commonService.getName(common)).assertEqual('Mouse');
      expect(new ProductService().getName(local)).assertEqual('Mouse');
      logEnd('testModuleProductShapeCompatible0021');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testModuleProductServiceEmptyName0022
     * @tc.name      testModuleProductServiceEmptyName0022
     * @tc.desc      Verify the module-declared ProductService returns an empty name unchanged
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testModuleProductServiceEmptyName0022', 0, () => {
      logBegin('testModuleProductServiceEmptyName0022');
      const service: ProductService = new ProductService();
      expect(service.getName({ id: 0, name: '' })).assertEqual('');
      expect(service.getName({ id: 0, name: '' }).length).assertEqual(0);
      logEnd('testModuleProductServiceEmptyName0022');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestConfigShape0023
     * @tc.name      testRequestConfigShape0023
     * @tc.desc      Verify RequestConfig accepts the documented url/timeout shape
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRequestConfigShape0023', 0, () => {
      logBegin('testRequestConfigShape0023');
      const config: RequestConfig = { url: 'https://api/users', timeout: DEFAULT_TIMEOUT };
      expect(config.url).assertEqual('https://api/users');
      expect(config.timeout).assertEqual(5000);
      expect(buildUrl('https://api', '/users')).assertEqual(config.url);
      logEnd('testRequestConfigShape0023');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testRequestConfigMinimalTimeout0024
     * @tc.name      testRequestConfigMinimalTimeout0024
     * @tc.desc      Verify RequestConfig accepts a zero timeout without validation
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testRequestConfigMinimalTimeout0024', 0, () => {
      logBegin('testRequestConfigMinimalTimeout0024');
      const config: RequestConfig = { url: '', timeout: 0 };
      expect(config.timeout).assertEqual(0);
      expect(config.url).assertEqual('');
      logEnd('testRequestConfigMinimalTimeout0024');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testApiConfigHostMatrix0025
     * @tc.name      testApiConfigHostMatrix0025
     * @tc.desc      Verify createApiConfig round-trips a matrix of hosts
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testApiConfigHostMatrix0025', 0, () => {
      logBegin('testApiConfigHostMatrix0025');
      const hosts: string[] = ['localhost', '127.0.0.1', 'a.b.c', 'https://x'];
      let matched: number = 0;
      for (let i = 0; i < hosts.length; i++) {
        if (createApiConfig(hosts[i]).host === hosts[i]) {
          matched++;
        }
      }
      expect(matched).assertEqual(hosts.length);
      expect(createApiConfig(hosts[0]).timeout).assertEqual(createApiConfig(hosts[3]).timeout);
      logEnd('testApiConfigHostMatrix0025');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_SYSTEM_testConstantsUsePositiveIntegers0026
     * @tc.name      testConstantsUsePositiveIntegers0026
     * @tc.desc      Verify exported numeric constants are positive integers suitable for config
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testConstantsUsePositiveIntegers0026', 0, () => {
      logBegin('testConstantsUsePositiveIntegers0026');
      expect(MAX_RETRY_COUNT > 0).assertTrue();
      expect(DEFAULT_TIMEOUT > 0).assertTrue();
      expect(Number.isInteger(MAX_RETRY_COUNT)).assertTrue();
      expect(Number.isInteger(DEFAULT_TIMEOUT)).assertTrue();
      expect(DEFAULT_TIMEOUT / MAX_RETRY_COUNT).assertClose(1666.6666667, 1e-6);
      logEnd('testConstantsUsePositiveIntegers0026');
    });

  });
}
