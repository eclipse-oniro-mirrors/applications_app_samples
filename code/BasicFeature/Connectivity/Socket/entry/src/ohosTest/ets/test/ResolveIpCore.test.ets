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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resolveIP } from '../../../main/ets/utils/Util';

const DOMAIN: number = 0xF814;
const TAG: string = 'ResolveIpCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function thrownOfNegative(): BusinessError | null {
  try {
    resolveIP(-1);
    return null;
  } catch (e) {
    return e as BusinessError;
  }
}

function thrownOfOversize(): BusinessError | null {
  try {
    resolveIP(4294967296);
    return null;
  } catch (e) {
    return e as BusinessError;
  }
}

export default function resolveIpCoreTest(): void {
  describe('SocketResolveIpCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0001
     * @tc.name      testResolveIp0001
     * @tc.desc      Checks resolveIP maps 0 to the dotted string 0.0.0.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0001 begin');
      const actual: string = resolveIP(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='0.0.0.0'`);
      expect(actual).assertEqual('0.0.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testResolveIp0001 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0002
     * @tc.name      testResolveIp0002
     * @tc.desc      Checks resolveIP maps 1 to the dotted string 0.0.0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0002 begin');
      const actual: string = resolveIP(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='0.0.0.1'`);
      expect(actual).assertEqual('0.0.0.1');
      log('testResolveIp0002 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0003
     * @tc.name      testResolveIp0003
     * @tc.desc      Checks resolveIP maps 2 to the dotted string 0.0.0.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0003 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(2)=${resolveIP(2)}, expected='0.0.0.2'`);
      expect(resolveIP(2)).assertEqual('0.0.0.2');
      log('testResolveIp0003 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0004
     * @tc.name      testResolveIp0004
     * @tc.desc      Checks resolveIP maps 3 to the dotted string 0.0.0.3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0004 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(3)=${resolveIP(3)}, expected='0.0.0.3'`);
      expect(resolveIP(3)).assertEqual('0.0.0.3');
      log('testResolveIp0004 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0005
     * @tc.name      testResolveIp0005
     * @tc.desc      Checks resolveIP maps 10 to the dotted string 0.0.0.10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0005 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(10)=${resolveIP(10)}, expected='0.0.0.10'`);
      expect(resolveIP(10)).assertEqual('0.0.0.10');
      log('testResolveIp0005 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0006
     * @tc.name      testResolveIp0006
     * @tc.desc      Checks resolveIP maps 63 to the dotted string 0.0.0.63.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0006 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(63)=${resolveIP(63)}, expected='0.0.0.63'`);
      expect(resolveIP(63)).assertEqual('0.0.0.63');
      log('testResolveIp0006 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0007
     * @tc.name      testResolveIp0007
     * @tc.desc      Checks resolveIP maps 64 to the dotted string 0.0.0.64.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0007 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(64)=${resolveIP(64)}, expected='0.0.0.64'`);
      expect(resolveIP(64)).assertEqual('0.0.0.64');
      log('testResolveIp0007 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0008
     * @tc.name      testResolveIp0008
     * @tc.desc      Checks resolveIP maps 100 to the dotted string 0.0.0.100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0008 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(100)=${resolveIP(100)}, expected='0.0.0.100'`);
      expect(resolveIP(100)).assertEqual('0.0.0.100');
      log('testResolveIp0008 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0009
     * @tc.name      testResolveIp0009
     * @tc.desc      Checks resolveIP maps 127 to the dotted string 0.0.0.127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0009 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(127)=${resolveIP(127)}, expected='0.0.0.127'`);
      expect(resolveIP(127)).assertEqual('0.0.0.127');
      log('testResolveIp0009 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0010
     * @tc.name      testResolveIp0010
     * @tc.desc      Checks resolveIP maps 128 to the dotted string 0.0.0.128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0010 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(128)=${resolveIP(128)}, expected='0.0.0.128'`);
      expect(resolveIP(128)).assertEqual('0.0.0.128');
      log('testResolveIp0010 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0011
     * @tc.name      testResolveIp0011
     * @tc.desc      Checks resolveIP maps 255 to the dotted string 0.0.0.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0011 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(255)=${resolveIP(255)}, expected='0.0.0.255'`);
      expect(resolveIP(255)).assertEqual('0.0.0.255');
      log('testResolveIp0011 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0012
     * @tc.name      testResolveIp0012
     * @tc.desc      Checks resolveIP maps 256 to the dotted string 0.0.1.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0012 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(256)=${resolveIP(256)}, expected='0.0.1.0'`);
      expect(resolveIP(256)).assertEqual('0.0.1.0');
      log('testResolveIp0012 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0013
     * @tc.name      testResolveIp0013
     * @tc.desc      Checks resolveIP maps 257 to the dotted string 0.0.1.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0013 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(257)=${resolveIP(257)}, expected='0.0.1.1'`);
      expect(resolveIP(257)).assertEqual('0.0.1.1');
      log('testResolveIp0013 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0014
     * @tc.name      testResolveIp0014
     * @tc.desc      Checks resolveIP maps 511 to the dotted string 0.0.1.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0014 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(511)=${resolveIP(511)}, expected='0.0.1.255'`);
      expect(resolveIP(511)).assertEqual('0.0.1.255');
      log('testResolveIp0014 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0015
     * @tc.name      testResolveIp0015
     * @tc.desc      Checks resolveIP maps 512 to the dotted string 0.0.2.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0015 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(512)=${resolveIP(512)}, expected='0.0.2.0'`);
      expect(resolveIP(512)).assertEqual('0.0.2.0');
      log('testResolveIp0015 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0016
     * @tc.name      testResolveIp0016
     * @tc.desc      Checks resolveIP maps 1023 to the dotted string 0.0.3.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0016 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(1023)=${resolveIP(1023)}, expected='0.0.3.255'`);
      expect(resolveIP(1023)).assertEqual('0.0.3.255');
      log('testResolveIp0016 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0017
     * @tc.name      testResolveIp0017
     * @tc.desc      Checks resolveIP maps 1024 to the dotted string 0.0.4.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0017 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(1024)=${resolveIP(1024)}, expected='0.0.4.0'`);
      expect(resolveIP(1024)).assertEqual('0.0.4.0');
      log('testResolveIp0017 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0018
     * @tc.name      testResolveIp0018
     * @tc.desc      Checks resolveIP maps 4095 to the dotted string 0.0.15.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0018 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(4095)=${resolveIP(4095)}, expected='0.0.15.255'`);
      expect(resolveIP(4095)).assertEqual('0.0.15.255');
      log('testResolveIp0018 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0019
     * @tc.name      testResolveIp0019
     * @tc.desc      Checks resolveIP maps 4096 to the dotted string 0.0.16.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0019 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(4096)=${resolveIP(4096)}, expected='0.0.16.0'`);
      expect(resolveIP(4096)).assertEqual('0.0.16.0');
      log('testResolveIp0019 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0020
     * @tc.name      testResolveIp0020
     * @tc.desc      Checks resolveIP maps 32322 to the dotted string 0.0.126.66.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0020 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(32322)=${resolveIP(32322)}, expected='0.0.126.66'`);
      expect(resolveIP(32322)).assertEqual('0.0.126.66');
      log('testResolveIp0020 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0021
     * @tc.name      testResolveIp0021
     * @tc.desc      Checks resolveIP maps 65534 to the dotted string 0.0.255.254.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0021 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(65534)=${resolveIP(65534)}, expected='0.0.255.254'`);
      expect(resolveIP(65534)).assertEqual('0.0.255.254');
      log('testResolveIp0021 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0022
     * @tc.name      testResolveIp0022
     * @tc.desc      Checks resolveIP maps 65535 to the dotted string 0.0.255.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0022 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(65535)=${resolveIP(65535)}, expected='0.0.255.255'`);
      expect(resolveIP(65535)).assertEqual('0.0.255.255');
      log('testResolveIp0022 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0023
     * @tc.name      testResolveIp0023
     * @tc.desc      Checks resolveIP maps 65536 to the dotted string 0.1.0.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0023 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(65536)=${resolveIP(65536)}, expected='0.1.0.0'`);
      expect(resolveIP(65536)).assertEqual('0.1.0.0');
      log('testResolveIp0023 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0024
     * @tc.name      testResolveIp0024
     * @tc.desc      Checks resolveIP maps 16777215 to the dotted string 0.255.255.255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0024 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(16777215)=${resolveIP(16777215)}`);
      expect(resolveIP(16777215)).assertEqual('0.255.255.255');
      log('testResolveIp0024 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0025
     * @tc.name      testResolveIp0025
     * @tc.desc      Checks resolveIP maps 16777216 to the dotted string 1.0.0.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0025 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(16777216)=${resolveIP(16777216)}`);
      expect(resolveIP(16777216)).assertEqual('1.0.0.0');
      log('testResolveIp0025 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0026
     * @tc.name      testResolveIp0026
     * @tc.desc      Checks resolveIP maps the loopback int 2130706433 to 127.0.0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0026 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(2130706433)=${resolveIP(2130706433)}`);
      expect(resolveIP(2130706433)).assertEqual('127.0.0.1');
      log('testResolveIp0026 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0027
     * @tc.name      testResolveIp0027
     * @tc.desc      Checks resolveIP maps 134744072 to the dotted string 8.8.8.8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0027 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(134744072)=${resolveIP(134744072)}`);
      expect(resolveIP(134744072)).assertEqual('8.8.8.8');
      log('testResolveIp0027 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0028
     * @tc.name      testResolveIp0028
     * @tc.desc      Checks resolveIP maps 3232235876 to the dotted string 192.168.1.100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0028 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(3232235876)=${resolveIP(3232235876)}`);
      expect(resolveIP(3232235876)).assertEqual('192.168.1.100');
      log('testResolveIp0028 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0029
     * @tc.name      testResolveIp0029
     * @tc.desc      Checks resolveIP maps 167772161 to the dotted string 10.0.0.1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0029 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(167772161)=${resolveIP(167772161)}`);
      expect(resolveIP(167772161)).assertEqual('10.0.0.1');
      log('testResolveIp0029 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0030
     * @tc.name      testResolveIp0030
     * @tc.desc      Checks resolveIP maps 16909060 to the dotted string 1.2.3.4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0030 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(16909060)=${resolveIP(16909060)}`);
      expect(resolveIP(16909060)).assertEqual('1.2.3.4');
      log('testResolveIp0030 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0031
     * @tc.name      testResolveIp0031
     * @tc.desc      Checks resolveIP maps 4294967294 to the dotted string 255.255.255.254.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0031 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(4294967294)=${resolveIP(4294967294)}`);
      expect(resolveIP(4294967294)).assertEqual('255.255.255.254');
      log('testResolveIp0031 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0032
     * @tc.name      testResolveIp0032
     * @tc.desc      Checks resolveIP accepts the inclusive upper bound 4294967295.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0032 begin');
      const actual: string = resolveIP(4294967295);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='255.255.255.255'`);
      expect(actual).assertEqual('255.255.255.255');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testResolveIp0032 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0033
     * @tc.name      testResolveIp0033
     * @tc.desc      Checks resolveIP truncates the fraction 0.5 to 0.0.0.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0033 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(0.5)=${resolveIP(0.5)}, expected='0.0.0.0'`);
      expect(resolveIP(0.5)).assertEqual('0.0.0.0');
      log('testResolveIp0033 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0034
     * @tc.name      testResolveIp0034
     * @tc.desc      Checks resolveIP truncates the fraction 2.7 to 0.0.0.2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0034 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(2.7)=${resolveIP(2.7)}, expected='0.0.0.2'`);
      expect(resolveIP(2.7)).assertEqual('0.0.0.2');
      log('testResolveIp0034 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0035
     * @tc.name      testResolveIp0035
     * @tc.desc      Checks resolveIP treats NaN as out of every comparison and returns 0.0.0.0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0035 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual resolveIP(NaN)=${resolveIP(NaN)}, expected='0.0.0.0'`);
      expect(resolveIP(NaN)).assertEqual('0.0.0.0');
      log('testResolveIp0035 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0036
     * @tc.name      testResolveIp0036
     * @tc.desc      Checks resolveIP throws for the negative input -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0036 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(-1);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0036 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0037
     * @tc.name      testResolveIp0037
     * @tc.desc      Checks resolveIP throws for the negative input -255.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0037 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(-255);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0037 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0038
     * @tc.name      testResolveIp0038
     * @tc.desc      Checks resolveIP throws for the negative input -2147483648.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0038 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(-2147483648);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0038 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0039
     * @tc.name      testResolveIp0039
     * @tc.desc      Checks resolveIP throws for the negative input -4294967296.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0039 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(-4294967296);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0039 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0040
     * @tc.name      testResolveIp0040
     * @tc.desc      Checks resolveIP throws for the first value above the upper bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0040 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(4294967296);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0040 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0041
     * @tc.name      testResolveIp0041
     * @tc.desc      Checks resolveIP throws for 4294967297 above the upper bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0041 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(4294967297);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0041 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0042
     * @tc.name      testResolveIp0042
     * @tc.desc      Checks resolveIP throws for the far out-of-range value 1e12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0042 begin');
      let hasThrown: boolean = false;
      try {
        resolveIP(1000000000000);
      } catch (e) {
        hasThrown = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasThrown=${hasThrown}`);
      expect(hasThrown).assertTrue();
      log('testResolveIp0042 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0043
     * @tc.name      testResolveIp0043
     * @tc.desc      Checks the thrown error carries the business code 400.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0043 begin');
      const thrownError: BusinessError | null = thrownOfNegative();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue thrownError !== null=${thrownError !== null}`);
      expect(thrownError !== null).assertTrue();
      if (thrownError !== null) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual thrownError.code=${thrownError.code}, expected=400`);
        expect(thrownError.code).assertEqual(400);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof thrownError.code=${typeof thrownError.code}`);
        expect(typeof thrownError.code).assertEqual('number');
      }
      log('testResolveIp0043 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0044
     * @tc.name      testResolveIp0044
     * @tc.desc      Checks the thrown error carries the name ErrorTips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0044 begin');
      const thrownError: BusinessError | null = thrownOfNegative();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue thrownError !== null=${thrownError !== null}`);
      expect(thrownError !== null).assertTrue();
      if (thrownError !== null) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual thrownError.name=${thrownError.name}, expected='ErrorTips'`);
        expect(thrownError.name).assertEqual('ErrorTips');
      }
      log('testResolveIp0044 end');
    })

    /**
     * @tc.number    SUB_SOCKET_RESOLVEIP_0045
     * @tc.name      testResolveIp0045
     * @tc.desc      Checks the thrown error carries the descriptive message text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testResolveIp0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testResolveIp0045 begin');
      const thrownError: BusinessError | null = thrownOfOversize();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue thrownError !== null=${thrownError !== null}`);
      expect(thrownError !== null).assertTrue();
      if (thrownError !== null) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual thrownError.message=${thrownError.message}`);
        expect(thrownError.message).assertEqual('the number is not normal');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof thrownError.message=${typeof thrownError.message}`);
        expect(typeof thrownError.message).assertEqual('string');
      }
      log('testResolveIp0045 end');
    })
  })
}
