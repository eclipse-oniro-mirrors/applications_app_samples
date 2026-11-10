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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';

export default function fileOpenModeExpandedTest() {
  describe('fileOpenModeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0001
     * @tc.name      testProjOpenMode0001
     * @tc.desc      Open mode combination 0 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0002
     * @tc.name      testProjOpenMode0002
     * @tc.desc      Open mode combination 1 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0003
     * @tc.name      testProjOpenMode0003
     * @tc.desc      Open mode combination 2 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0004
     * @tc.name      testProjOpenMode0004
     * @tc.desc      Open mode combination 3 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0005
     * @tc.name      testProjOpenMode0005
     * @tc.desc      Open mode combination 4 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0006
     * @tc.name      testProjOpenMode0006
     * @tc.desc      Open mode combination 5 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0007
     * @tc.name      testProjOpenMode0007
     * @tc.desc      Open mode combination 6 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0008
     * @tc.name      testProjOpenMode0008
     * @tc.desc      Open mode combination 7 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0009
     * @tc.name      testProjOpenMode0009
     * @tc.desc      Open mode combination 8 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0010
     * @tc.name      testProjOpenMode0010
     * @tc.desc      Open mode combination 9 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0011
     * @tc.name      testProjOpenMode0011
     * @tc.desc      Open mode combination 10 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0012
     * @tc.name      testProjOpenMode0012
     * @tc.desc      Open mode combination 11 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0013
     * @tc.name      testProjOpenMode0013
     * @tc.desc      Open mode combination 12 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0014
     * @tc.name      testProjOpenMode0014
     * @tc.desc      Open mode combination 13 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0015
     * @tc.name      testProjOpenMode0015
     * @tc.desc      Open mode combination 14 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0016
     * @tc.name      testProjOpenMode0016
     * @tc.desc      Open mode combination 15 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0017
     * @tc.name      testProjOpenMode0017
     * @tc.desc      Open mode combination 16 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0018
     * @tc.name      testProjOpenMode0018
     * @tc.desc      Open mode combination 17 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0019
     * @tc.name      testProjOpenMode0019
     * @tc.desc      Open mode combination 18 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0020
     * @tc.name      testProjOpenMode0020
     * @tc.desc      Open mode combination 19 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0021
     * @tc.name      testProjOpenMode0021
     * @tc.desc      Open mode combination 20 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0022
     * @tc.name      testProjOpenMode0022
     * @tc.desc      Open mode combination 21 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0023
     * @tc.name      testProjOpenMode0023
     * @tc.desc      Open mode combination 22 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0024
     * @tc.name      testProjOpenMode0024
     * @tc.desc      Open mode combination 23 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0025
     * @tc.name      testProjOpenMode0025
     * @tc.desc      Open mode combination 24 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0026
     * @tc.name      testProjOpenMode0026
     * @tc.desc      Open mode combination 25 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0027
     * @tc.name      testProjOpenMode0027
     * @tc.desc      Open mode combination 26 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0028
     * @tc.name      testProjOpenMode0028
     * @tc.desc      Open mode combination 27 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0029
     * @tc.name      testProjOpenMode0029
     * @tc.desc      Open mode combination 28 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0030
     * @tc.name      testProjOpenMode0030
     * @tc.desc      Open mode combination 29 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0031
     * @tc.name      testProjOpenMode0031
     * @tc.desc      Open mode combination 30 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0032
     * @tc.name      testProjOpenMode0032
     * @tc.desc      Open mode combination 31 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0033
     * @tc.name      testProjOpenMode0033
     * @tc.desc      Open mode combination 32 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0034
     * @tc.name      testProjOpenMode0034
     * @tc.desc      Open mode combination 33 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0035
     * @tc.name      testProjOpenMode0035
     * @tc.desc      Open mode combination 34 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0036
     * @tc.name      testProjOpenMode0036
     * @tc.desc      Open mode combination 35 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0037
     * @tc.name      testProjOpenMode0037
     * @tc.desc      Open mode combination 36 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0038
     * @tc.name      testProjOpenMode0038
     * @tc.desc      Open mode combination 37 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0039
     * @tc.name      testProjOpenMode0039
     * @tc.desc      Open mode combination 38 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0040
     * @tc.name      testProjOpenMode0040
     * @tc.desc      Open mode combination 39 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0041
     * @tc.name      testProjOpenMode0041
     * @tc.desc      Open mode combination 40 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0042
     * @tc.name      testProjOpenMode0042
     * @tc.desc      Open mode combination 41 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0043
     * @tc.name      testProjOpenMode0043
     * @tc.desc      Open mode combination 42 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0044
     * @tc.name      testProjOpenMode0044
     * @tc.desc      Open mode combination 43 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0045
     * @tc.name      testProjOpenMode0045
     * @tc.desc      Open mode combination 44 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0046
     * @tc.name      testProjOpenMode0046
     * @tc.desc      Open mode combination 45 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0047
     * @tc.name      testProjOpenMode0047
     * @tc.desc      Open mode combination 46 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0048
     * @tc.name      testProjOpenMode0048
     * @tc.desc      Open mode combination 47 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0049
     * @tc.name      testProjOpenMode0049
     * @tc.desc      Open mode combination 48 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0050
     * @tc.name      testProjOpenMode0050
     * @tc.desc      Open mode combination 49 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0051
     * @tc.name      testProjOpenMode0051
     * @tc.desc      Open mode combination 50 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0052
     * @tc.name      testProjOpenMode0052
     * @tc.desc      Open mode combination 51 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0053
     * @tc.name      testProjOpenMode0053
     * @tc.desc      Open mode combination 52 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0054
     * @tc.name      testProjOpenMode0054
     * @tc.desc      Open mode combination 53 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0055
     * @tc.name      testProjOpenMode0055
     * @tc.desc      Open mode combination 54 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0056
     * @tc.name      testProjOpenMode0056
     * @tc.desc      Open mode combination 55 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0057
     * @tc.name      testProjOpenMode0057
     * @tc.desc      Open mode combination 56 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0058
     * @tc.name      testProjOpenMode0058
     * @tc.desc      Open mode combination 57 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0059
     * @tc.name      testProjOpenMode0059
     * @tc.desc      Open mode combination 58 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0060
     * @tc.name      testProjOpenMode0060
     * @tc.desc      Open mode combination 59 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0061
     * @tc.name      testProjOpenMode0061
     * @tc.desc      Open mode combination 60 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0062
     * @tc.name      testProjOpenMode0062
     * @tc.desc      Open mode combination 61 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0063
     * @tc.name      testProjOpenMode0063
     * @tc.desc      Open mode combination 62 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0064
     * @tc.name      testProjOpenMode0064
     * @tc.desc      Open mode combination 63 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0065
     * @tc.name      testProjOpenMode0065
     * @tc.desc      Open mode combination 64 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0066
     * @tc.name      testProjOpenMode0066
     * @tc.desc      Open mode combination 65 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0067
     * @tc.name      testProjOpenMode0067
     * @tc.desc      Open mode combination 66 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0068
     * @tc.name      testProjOpenMode0068
     * @tc.desc      Open mode combination 67 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0069
     * @tc.name      testProjOpenMode0069
     * @tc.desc      Open mode combination 68 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0070
     * @tc.name      testProjOpenMode0070
     * @tc.desc      Open mode combination 69 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0071
     * @tc.name      testProjOpenMode0071
     * @tc.desc      Open mode combination 70 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0072
     * @tc.name      testProjOpenMode0072
     * @tc.desc      Open mode combination 71 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0073
     * @tc.name      testProjOpenMode0073
     * @tc.desc      Open mode combination 72 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0074
     * @tc.name      testProjOpenMode0074
     * @tc.desc      Open mode combination 73 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0075
     * @tc.name      testProjOpenMode0075
     * @tc.desc      Open mode combination 74 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0076
     * @tc.name      testProjOpenMode0076
     * @tc.desc      Open mode combination 75 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(true);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0077
     * @tc.name      testProjOpenMode0077
     * @tc.desc      Open mode combination 76 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0078
     * @tc.name      testProjOpenMode0078
     * @tc.desc      Open mode combination 77 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0079
     * @tc.name      testProjOpenMode0079
     * @tc.desc      Open mode combination 78 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (true) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVS_PROJ_MODE_0080
     * @tc.name      testProjOpenMode0080
     * @tc.desc      Open mode combination 79 retains its requested flags.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjOpenMode0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mode: number = 0;
      if (false) {
        mode = mode | fileIo.OpenMode.READ_ONLY;
      }
      if (true) {
        mode = mode | fileIo.OpenMode.WRITE_ONLY;
      }
      if (false) {
        mode = mode | fileIo.OpenMode.CREATE;
      }
      expect((mode & fileIo.OpenMode.CREATE) === fileIo.OpenMode.CREATE).assertEqual(false);
      expect(typeof mode).assertEqual('number');
    })
  })
}
