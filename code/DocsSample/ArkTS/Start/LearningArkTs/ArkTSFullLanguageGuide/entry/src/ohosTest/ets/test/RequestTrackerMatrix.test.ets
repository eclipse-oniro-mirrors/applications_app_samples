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
import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RequestTracker, RequestStatus, MAX_RETRY_COUNT, DEFAULT_TIMEOUT, createApiConfig, ApiConfig,
  RenamedUserService } from '../../../main/ets/pages/ModuleSystem';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_TRACKER]';

export default function RequestTrackerMatrixTest(): void {
  describe('RequestTrackerMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0001
     * @tc.name      testRequestTrackerMatrix0001
     * @tc.desc      RequestTracker moves from idle to idle without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0001 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "idle";
      const b: RequestStatus = "idle";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("idle");
      expect(config.host).assertEqual("idle");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0002
     * @tc.name      testRequestTrackerMatrix0002
     * @tc.desc      RequestTracker moves from idle to loading without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0002 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "idle";
      const b: RequestStatus = "loading";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("loading");
      expect(config.host).assertEqual("loading");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0003
     * @tc.name      testRequestTrackerMatrix0003
     * @tc.desc      RequestTracker moves from idle to success without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0003 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "idle";
      const b: RequestStatus = "success";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("success");
      expect(config.host).assertEqual("success");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0004
     * @tc.name      testRequestTrackerMatrix0004
     * @tc.desc      RequestTracker moves from idle to failed without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0004 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "idle";
      const b: RequestStatus = "failed";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("failed");
      expect(config.host).assertEqual("failed");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0005
     * @tc.name      testRequestTrackerMatrix0005
     * @tc.desc      RequestTracker moves from loading to idle without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0005 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "loading";
      const b: RequestStatus = "idle";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("idle");
      expect(config.host).assertEqual("idle");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0006
     * @tc.name      testRequestTrackerMatrix0006
     * @tc.desc      RequestTracker moves from loading to loading without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0006 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "loading";
      const b: RequestStatus = "loading";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("loading");
      expect(config.host).assertEqual("loading");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0007
     * @tc.name      testRequestTrackerMatrix0007
     * @tc.desc      RequestTracker moves from loading to success without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0007 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "loading";
      const b: RequestStatus = "success";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("success");
      expect(config.host).assertEqual("success");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0008
     * @tc.name      testRequestTrackerMatrix0008
     * @tc.desc      RequestTracker moves from loading to failed without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0008 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "loading";
      const b: RequestStatus = "failed";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("failed");
      expect(config.host).assertEqual("failed");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0009
     * @tc.name      testRequestTrackerMatrix0009
     * @tc.desc      RequestTracker moves from success to idle without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0009 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "success";
      const b: RequestStatus = "idle";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("idle");
      expect(config.host).assertEqual("idle");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0010
     * @tc.name      testRequestTrackerMatrix0010
     * @tc.desc      RequestTracker moves from success to loading without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0010 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "success";
      const b: RequestStatus = "loading";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("loading");
      expect(config.host).assertEqual("loading");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0011
     * @tc.name      testRequestTrackerMatrix0011
     * @tc.desc      RequestTracker moves from success to success without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0011 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "success";
      const b: RequestStatus = "success";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("success");
      expect(config.host).assertEqual("success");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0012
     * @tc.name      testRequestTrackerMatrix0012
     * @tc.desc      RequestTracker moves from success to failed without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0012 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "success";
      const b: RequestStatus = "failed";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("failed");
      expect(config.host).assertEqual("failed");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0013
     * @tc.name      testRequestTrackerMatrix0013
     * @tc.desc      RequestTracker moves from failed to idle without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0013 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "failed";
      const b: RequestStatus = "idle";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("idle");
      expect(config.host).assertEqual("idle");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0014
     * @tc.name      testRequestTrackerMatrix0014
     * @tc.desc      RequestTracker moves from failed to loading without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0014 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "failed";
      const b: RequestStatus = "loading";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("loading");
      expect(config.host).assertEqual("loading");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0015
     * @tc.name      testRequestTrackerMatrix0015
     * @tc.desc      RequestTracker moves from failed to success without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testRequestTrackerMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0015 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "failed";
      const b: RequestStatus = "success";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("success");
      expect(config.host).assertEqual("success");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKER_testRequestTrackerMatrix0016
     * @tc.name      testRequestTrackerMatrix0016
     * @tc.desc      RequestTracker moves from failed to failed without leaking state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRequestTrackerMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0016 begin');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      const a: RequestStatus = "failed";
      const b: RequestStatus = "failed";
      tracker.setStatus(a);
      expect(tracker.getStatus()).assertEqual(a);
      tracker.setStatus(b);
      expect(tracker.getStatus()).assertEqual(b);
      const other: RequestTracker = new RequestTracker();
      expect(other.getStatus()).assertEqual('idle');
      expect(tracker.getStatus()).assertEqual(b);
      expect(MAX_RETRY_COUNT).assertEqual(3);
      expect(DEFAULT_TIMEOUT).assertEqual(5000);
      const config: ApiConfig = createApiConfig("failed");
      expect(config.host).assertEqual("failed");
      expect(config.timeout).assertEqual(5000);
      const renamed: RenamedUserService = new RenamedUserService();
      expect(renamed.getName()).assertEqual('UserService');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRequestTrackerMatrix0016 end');
    })

  });
}
