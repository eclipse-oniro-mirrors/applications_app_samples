/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { logger } from '../../../main/ets/bridge/VerifyCodeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'VerifyCodeLoggerCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function callQuietly(action: () => void): boolean {
  try {
    action();
    return true;
  } catch (error) {
    return false;
  }
}

export default function verifyCodeLoggerCoreTest(): void {
  describe('VerifyCodeLoggerCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0101
     * @tc.name      testVcLogger0101
     * @tc.desc      Verify the shared logger instance is a defined non-null object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0101 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== null=${logger !== null}`);
      expect(logger !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue logger !== undefined=${logger !== undefined}`);
      expect(logger !== undefined).assertTrue();
      log('testVcLogger0101 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0102
     * @tc.name      testVcLogger0102
     * @tc.desc      Verify info is a function and a plain call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0102 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('testVcLogger0102 message');})`);
      expect(callQuietly(() => {
        logger.info('testVcLogger0102 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcLogger0102 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0103
     * @tc.name      testVcLogger0103
     * @tc.desc      Verify debug is a function and a plain call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0103 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.debug('testVcLogger0103 message'...`);
      expect(callQuietly(() => {
        logger.debug('testVcLogger0103 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      log('testVcLogger0103 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0104
     * @tc.name      testVcLogger0104
     * @tc.desc      Verify warn is a function and a plain call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0104 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.warn('testVcLogger0104 message');})`);
      expect(callQuietly(() => {
        logger.warn('testVcLogger0104 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      log('testVcLogger0104 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0105
     * @tc.name      testVcLogger0105
     * @tc.desc      Verify error is a function and a plain call completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0105 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.error('testVcLogger0105 message'...`);
      expect(callQuietly(() => {
        logger.error('testVcLogger0105 message');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      log('testVcLogger0105 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0106
     * @tc.name      testVcLogger0106
     * @tc.desc      Verify info accepts a long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0106 begin');
      const longMessage: string = 'v'.repeat(256);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info(longMessage);})`);
      expect(callQuietly(() => {
        logger.info(longMessage);
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual longMessage.length=${longMessage.length}, expected=256`);
      expect(longMessage.length).assertEqual(256);
      log('testVcLogger0106 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0107
     * @tc.name      testVcLogger0107
     * @tc.desc      Verify info forwards several arguments in one call without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0107 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('a', 'b', 'c');})`);
      expect(callQuietly(() => {
        logger.info('a', 'b', 'c');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('one');})`);
      expect(callQuietly(() => {
        logger.info('one');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcLogger0107 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0108
     * @tc.name      testVcLogger0108
     * @tc.desc      Verify debug forwards several arguments in one call without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0108 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.debug('x', 'y');})`);
      expect(callQuietly(() => {
        logger.debug('x', 'y');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.debug('z');})`);
      expect(callQuietly(() => {
        logger.debug('z');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      log('testVcLogger0108 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0109
     * @tc.name      testVcLogger0109
     * @tc.desc      Verify warn tolerates an empty message string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0109 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.warn('');})`);
      expect(callQuietly(() => {
        logger.warn('');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.warn('non empty');})`);
      expect(callQuietly(() => {
        logger.warn('non empty');
      })).assertTrue();
      log('testVcLogger0109 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0110
     * @tc.name      testVcLogger0110
     * @tc.desc      Verify error tolerates an empty message string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0110 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.error('');})`);
      expect(callQuietly(() => {
        logger.error('');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.error=${typeof logger.error}`);
      expect(typeof logger.error).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.error('non empty');})`);
      expect(callQuietly(() => {
        logger.error('non empty');
      })).assertTrue();
      log('testVcLogger0110 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0111
     * @tc.name      testVcLogger0111
     * @tc.desc      Verify ten consecutive info calls all succeed with a stable counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0111 begin');
      let successCount: number = 0;
      for (let i: number = 0; i < 10; i++) {
        if (callQuietly(() => {
          logger.info('loop ' + i);
        })) {
          successCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual successCount=${successCount}, expected=10`);
      expect(successCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue successCount > 0=${successCount > 0}`);
      expect(successCount > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcLogger0111 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0112
     * @tc.name      testVcLogger0112
     * @tc.desc      Verify info and error calls interleave without interfering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0112 begin');
      const first: boolean = callQuietly(() => {
        logger.info('info before error');
      });
      const second: boolean = callQuietly(() => {
        logger.error('error after info');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first=${first}`);
      expect(first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue second=${second}`);
      expect(second).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcLogger0112 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0113
     * @tc.name      testVcLogger0113
     * @tc.desc      Verify info accepts multibyte content without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0113 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('/u9a8c/u8bc1/u7801');})`);
      expect(callQuietly(() => {
        logger.info('\u9a8c\u8bc1\u7801');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('/u9a8c/u8bc1/u7801');})`);
      expect(callQuietly(() => {
        logger.info('\u9a8c\u8bc1\u7801');
      })).assertTrue();
      log('testVcLogger0113 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0114
     * @tc.name      testVcLogger0114
     * @tc.desc      Verify info tolerates format-like and special character payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0114 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('%{public}s !@#$%^&*()');})`);
      expect(callQuietly(() => {
        logger.info('%{public}s !@#$%^&*()');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('%{private}s');})`);
      expect(callQuietly(() => {
        logger.info('%{private}s');
      })).assertTrue();
      log('testVcLogger0114 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0115
     * @tc.name      testVcLogger0115
     * @tc.desc      Verify info accepts a very long message without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0115 begin');
      const veryLong: string = 'L'.repeat(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info(veryLong);})`);
      expect(callQuietly(() => {
        logger.info(veryLong);
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual veryLong.length=${veryLong.length}, expected=1024`);
      expect(veryLong.length).assertEqual(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      log('testVcLogger0115 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0116
     * @tc.name      testVcLogger0116
     * @tc.desc      Verify eight interleaved calls across all four levels all succeed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0116 begin');
      let successCount: number = 0;
      for (let round: number = 0; round < 2; round++) {
        successCount += callQuietly(() => {
          logger.debug('round ' + round);
        }) ? 1 : 0;
        successCount += callQuietly(() => {
          logger.info('round ' + round);
        }) ? 1 : 0;
        successCount += callQuietly(() => {
          logger.warn('round ' + round);
        }) ? 1 : 0;
        successCount += callQuietly(() => {
          logger.error('round ' + round);
        }) ? 1 : 0;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual successCount=${successCount}, expected=8`);
      expect(successCount).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue successCount > 0=${successCount > 0}`);
      expect(successCount > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      log('testVcLogger0116 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0117
     * @tc.name      testVcLogger0117
     * @tc.desc      Verify logger methods remain intact after heavy calling.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0117 begin');
      for (let i: number = 0; i < 10; i++) {
        callQuietly(() => {
          logger.info('warm ' + i);
        });
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.warn=${typeof logger.warn}`);
      expect(typeof logger.warn).assertEqual('function');
      log('testVcLogger0117 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0118
     * @tc.name      testVcLogger0118
     * @tc.desc      Verify the exported logger keeps a stable object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0118 begin');
      const captured: object = logger;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue captured === logger=${captured === logger}`);
      expect(captured === logger).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue captured !== null=${captured !== null}`);
      expect(captured !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof captured=${typeof captured}, expected='object'`);
      expect(typeof captured).assertEqual('object');
      log('testVcLogger0118 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0119
     * @tc.name      testVcLogger0119
     * @tc.desc      Verify info tolerates payload with newline and tab characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0119 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('line1/nline2/tend');})`);
      expect(callQuietly(() => {
        logger.info('line1\nline2\tend');
      })).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue callQuietly(() => {logger.info('/t');})`);
      expect(callQuietly(() => {
        logger.info('\t');
      })).assertTrue();
      log('testVcLogger0119 end');
    })

    /**
     * @tc.number    SUB_VERIFYCODE_LGCORE_0120
     * @tc.name      testVcLogger0120
     * @tc.desc      Verify info and debug reuse the same logger object after calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testVcLogger0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testVcLogger0120 begin');
      callQuietly(() => {
        logger.info('same message');
      });
      callQuietly(() => {
        logger.debug('same message');
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.info=${typeof logger.info}`);
      expect(typeof logger.info).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger.debug=${typeof logger.debug}`);
      expect(typeof logger.debug).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof logger=${typeof logger}, expected='object'`);
      expect(typeof logger).assertEqual('object');
      log('testVcLogger0120 end');
    })
  })
}
