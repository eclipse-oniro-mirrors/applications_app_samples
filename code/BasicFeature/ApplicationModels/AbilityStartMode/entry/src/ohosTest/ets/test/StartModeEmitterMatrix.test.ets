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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { emitter } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function startModeEmitterMatrixTest(): void {
  describe('StartModeEmitterMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0001
     * @tc.name      startModeEmitterMatrix0001
     * @tc.desc      事件 3001 以 IMMEDIATE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0001 begin');
      const eventId: number = 3001;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IMMEDIATE }, { data: { count: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0002
     * @tc.name      startModeEmitterMatrix0002
     * @tc.desc      事件 3002 以 IMMEDIATE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0002 begin');
      const eventId: number = 3002;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IMMEDIATE }, { data: { foodName: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0003
     * @tc.name      startModeEmitterMatrix0003
     * @tc.desc      事件 3003 以 IMMEDIATE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0003 begin');
      const eventId: number = 3003;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IMMEDIATE }, { data: { categoryId: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0004
     * @tc.name      startModeEmitterMatrix0004
     * @tc.desc      事件 3004 以 IMMEDIATE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0004 begin');
      const eventId: number = 3004;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IMMEDIATE }, { data: { launchMode: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0005
     * @tc.name      startModeEmitterMatrix0005
     * @tc.desc      事件 3005 以 IMMEDIATE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0005 begin');
      const eventId: number = 3005;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IMMEDIATE }, { data: { instanceKey: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0006
     * @tc.name      startModeEmitterMatrix0006
     * @tc.desc      事件 3011 以 HIGH 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0006 begin');
      const eventId: number = 3011;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.HIGH }, { data: { count: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0007
     * @tc.name      startModeEmitterMatrix0007
     * @tc.desc      事件 3012 以 HIGH 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0007 begin');
      const eventId: number = 3012;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.HIGH }, { data: { foodName: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0008
     * @tc.name      startModeEmitterMatrix0008
     * @tc.desc      事件 3013 以 HIGH 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0008 begin');
      const eventId: number = 3013;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.HIGH }, { data: { categoryId: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0008 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0009
     * @tc.name      startModeEmitterMatrix0009
     * @tc.desc      事件 3014 以 HIGH 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0009 begin');
      const eventId: number = 3014;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.HIGH }, { data: { launchMode: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0009 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0010
     * @tc.name      startModeEmitterMatrix0010
     * @tc.desc      事件 3015 以 HIGH 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0010 begin');
      const eventId: number = 3015;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.HIGH }, { data: { instanceKey: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0010 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0011
     * @tc.name      startModeEmitterMatrix0011
     * @tc.desc      事件 3021 以 LOW 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0011 begin');
      const eventId: number = 3021;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.LOW }, { data: { count: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0011 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0012
     * @tc.name      startModeEmitterMatrix0012
     * @tc.desc      事件 3022 以 LOW 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0012 begin');
      const eventId: number = 3022;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.LOW }, { data: { foodName: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0012 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0013
     * @tc.name      startModeEmitterMatrix0013
     * @tc.desc      事件 3023 以 LOW 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0013 begin');
      const eventId: number = 3023;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.LOW }, { data: { categoryId: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0013 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0014
     * @tc.name      startModeEmitterMatrix0014
     * @tc.desc      事件 3024 以 LOW 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0014 begin');
      const eventId: number = 3024;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.LOW }, { data: { launchMode: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0014 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0015
     * @tc.name      startModeEmitterMatrix0015
     * @tc.desc      事件 3025 以 LOW 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0015 begin');
      const eventId: number = 3025;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.LOW }, { data: { instanceKey: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0015 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0016
     * @tc.name      startModeEmitterMatrix0016
     * @tc.desc      事件 3031 以 IDLE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0016 begin');
      const eventId: number = 3031;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IDLE }, { data: { count: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0016 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0017
     * @tc.name      startModeEmitterMatrix0017
     * @tc.desc      事件 3032 以 IDLE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0017 begin');
      const eventId: number = 3032;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IDLE }, { data: { foodName: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0017 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0018
     * @tc.name      startModeEmitterMatrix0018
     * @tc.desc      事件 3033 以 IDLE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0018 begin');
      const eventId: number = 3033;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IDLE }, { data: { categoryId: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0018 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0019
     * @tc.name      startModeEmitterMatrix0019
     * @tc.desc      事件 3034 以 IDLE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0019 begin');
      const eventId: number = 3034;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IDLE }, { data: { launchMode: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0019 end');
    })

    /**
     * @tc.number    SUB_START_MODE_EMITTER_0020
     * @tc.name      startModeEmitterMatrix0020
     * @tc.desc      事件 3035 以 IDLE 优先级发送后能收到负载
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('startModeEmitterMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0020 begin');
      const eventId: number = 3035;
      let received: number = -1;
      let payloadKeys: number = 0;
      const callback = (eventData: emitter.EventData): void => {
        received = 1;
        payloadKeys = Object.keys(eventData.data ?? {}).length;
      };
      emitter.on({ eventId: eventId }, callback);
      emitter.emit({ eventId: eventId, priority: emitter.EventPriority.IDLE }, { data: { instanceKey: 1 } });
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 50);
      });
      emitter.off(eventId, callback);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 received=${received}`);
      expect(received).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 payloadKeys=${payloadKeys}`);
      expect(payloadKeys).assertEqual(1);
      const actual3: string = typeof received;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeEmitterMatrix0020 end');
    })
  })
}
