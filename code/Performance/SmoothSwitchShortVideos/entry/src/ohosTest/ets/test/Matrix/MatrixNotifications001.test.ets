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

import { describe, it } from '@ohos/hypium';
import { NotificationVector, verifyNotification } from '../Shared/MatrixFixture';

export default function registerMatrixNotifications001(): void {
  describe('MatrixNotifications001', (): void => {
    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0001
     * @tc.name MatrixNotifications001_0001
     * @tc.desc Verify notifications input vector 1 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0001', 0, (): void => {
      const vector = new NotificationVector("LRRCNArRCNArRLCAlrN", 0, "change:0,reload,add:0,change:0,reload,add:0,change:0,add:0", "change:0,reload,add:0,change:0,reload,add:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0002
     * @tc.name MatrixNotifications001_0002
     * @tc.desc Verify notifications input vector 2 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0002', 0, (): void => {
      const vector = new NotificationVector("LRCAANlRCNArRLCAlrN", 7, "change:7,add:7,add:7,reload,change:7,add:7", "change:7,add:7,add:7,reload,change:7,reload,add:7,change:7,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0003
     * @tc.name MatrixNotifications001_0003
     * @tc.desc Verify notifications input vector 3 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0003', 0, (): void => {
      const vector = new NotificationVector("LRNAClrLNLNrNlrN", 1, "reload,add:1,change:1,reload,reload,reload", "reload,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0004
     * @tc.name MatrixNotifications001_0004
     * @tc.desc Verify notifications input vector 4 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0004', 0, (): void => {
      const vector = new NotificationVector("LRCAANrLAlLRAClrN", -2, "change:-2,add:-2,add:-2,reload,add:-2,add:-2,change:-2", "change:-2,add:-2,add:-2,reload,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0005
     * @tc.name MatrixNotifications001_0005
     * @tc.desc Verify notifications input vector 5 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0005', 0, (): void => {
      const vector = new NotificationVector("LCCAlRALNrNlrN", 31, "change:31,change:31,add:31,reload,reload", "add:31,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0006
     * @tc.name MatrixNotifications001_0006
     * @tc.desc Verify notifications input vector 6 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0006', 0, (): void => {
      const vector = new NotificationVector("LLRNAClLNLNrNlrN", -1, "reload,add:-1,change:-1,reload,reload,reload", "reload,add:-1,change:-1,reload,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0007
     * @tc.name MatrixNotifications001_0007
     * @tc.desc Verify notifications input vector 7 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0007', 0, (): void => {
      const vector = new NotificationVector("LLRAAClRCNARAlClrN", -1, "add:-1,add:-1,change:-1", "add:-1,add:-1,change:-1,change:-1,reload,add:-1,add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0008
     * @tc.name MatrixNotifications001_0008
     * @tc.desc Verify notifications input vector 8 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0008', 0, (): void => {
      const vector = new NotificationVector("LRCNArNACRAlClrN", 31, "change:31,reload,add:31,reload,add:31,change:31,add:31", "change:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0009
     * @tc.name MatrixNotifications001_0009
     * @tc.desc Verify notifications input vector 9 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0009', 0, (): void => {
      const vector = new NotificationVector("LRRACAClLNRAlClrN", 1, "add:1,change:1,add:1,change:1,reload,add:1", "add:1,change:1,add:1,change:1,reload,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0010
     * @tc.name MatrixNotifications001_0010
     * @tc.desc Verify notifications input vector 10 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0010', 0, (): void => {
      const vector = new NotificationVector("RCCArClLRAClrN", 7, "add:7,change:7", "change:7,change:7,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0011
     * @tc.name MatrixNotifications001_0011
     * @tc.desc Verify notifications input vector 11 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0011', 0, (): void => {
      const vector = new NotificationVector("LLRNNACrRNRAlClrN", 0, "reload,reload,add:0,change:0,reload,add:0", "reload,reload,add:0,change:0,reload,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0012
     * @tc.name MatrixNotifications001_0012
     * @tc.desc Verify notifications input vector 12 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0012', 0, (): void => {
      const vector = new NotificationVector("LRACACrRCNAlLRAClrN", 31, "add:31,change:31,add:31,change:31,change:31,reload,add:31,add:31,change:31", "add:31,change:31,add:31,change:31,change:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0013
     * @tc.name MatrixNotifications001_0013
     * @tc.desc Verify notifications input vector 13 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0013', 0, (): void => {
      const vector = new NotificationVector("LRCCAlLNAClLRAClrN", 7, "change:7,change:7,add:7,reload,add:7,change:7,add:7,change:7", "change:7,change:7,add:7,reload,add:7,change:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0014
     * @tc.name MatrixNotifications001_0014
     * @tc.desc Verify notifications input vector 14 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0014', 0, (): void => {
      const vector = new NotificationVector("RLCNAlLCNALNrNlrN", 7, "change:7,reload,add:7,change:7,reload,add:7,reload,reload", "change:7,reload,add:7,change:7,reload,add:7,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0015
     * @tc.name MatrixNotifications001_0015
     * @tc.desc Verify notifications input vector 15 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0015', 0, (): void => {
      const vector = new NotificationVector("RLCCArRCNAlLRAClrN", 0, "change:0,change:0,add:0,change:0,reload,add:0,add:0,change:0", "change:0,change:0,add:0,change:0,reload,add:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0016
     * @tc.name MatrixNotifications001_0016
     * @tc.desc Verify notifications input vector 16 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0016', 0, (): void => {
      const vector = new NotificationVector("RAAClrLAAClLRAClrN", 2, "add:2,add:2,change:2,add:2,change:2", "add:2,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0017
     * @tc.name MatrixNotifications001_0017
     * @tc.desc Verify notifications input vector 17 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0017', 0, (): void => {
      const vector = new NotificationVector("LLRNNAClrLCrRLCAlrN", 0, "reload,reload,add:0,change:0,change:0,change:0,add:0", "reload,reload,add:0,change:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0018
     * @tc.name MatrixNotifications001_0018
     * @tc.desc Verify notifications input vector 18 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0018', 0, (): void => {
      const vector = new NotificationVector("RLNACrCrRLCAlrN", 1, "reload,add:1,change:1,change:1,change:1,add:1", "reload,add:1,change:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0019
     * @tc.name MatrixNotifications001_0019
     * @tc.desc Verify notifications input vector 19 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0019', 0, (): void => {
      const vector = new NotificationVector("LRRACAClLCNARAlClrN", 1024, "add:1024,change:1024,add:1024,change:1024,change:1024,reload,add:1024,add:1024", "add:1024,change:1024,add:1024,change:1024,change:1024,reload,add:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0020
     * @tc.name MatrixNotifications001_0020
     * @tc.desc Verify notifications input vector 20 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0020', 0, (): void => {
      const vector = new NotificationVector("LNNAClLAACrRLCAlrN", -1, "reload,reload,add:-1,change:-1,add:-1,add:-1,change:-1,change:-1,add:-1", "change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0021
     * @tc.name MatrixNotifications001_0021
     * @tc.desc Verify notifications input vector 21 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0021', 0, (): void => {
      const vector = new NotificationVector("LACNlrLNrRLCAlrN", -1, "add:-1,change:-1,reload,reload,change:-1,add:-1", "change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0022
     * @tc.name MatrixNotifications001_0022
     * @tc.desc Verify notifications input vector 22 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0022', 0, (): void => {
      const vector = new NotificationVector("RCAANlLClLRAClrN", 31, "change:31,add:31,change:31", "change:31,add:31,add:31,reload,change:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0023
     * @tc.name MatrixNotifications001_0023
     * @tc.desc Verify notifications input vector 23 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0023', 0, (): void => {
      const vector = new NotificationVector("RACAClRNlLRAClrN", 1024, "add:1024,change:1024", "add:1024,change:1024,add:1024,change:1024,reload,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0024
     * @tc.name MatrixNotifications001_0024
     * @tc.desc Verify notifications input vector 24 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0024', 0, (): void => {
      const vector = new NotificationVector("RACACrNlLRAClrN", 1024, "add:1024,change:1024", "add:1024,change:1024,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0025
     * @tc.name MatrixNotifications001_0025
     * @tc.desc Verify notifications input vector 25 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0025', 0, (): void => {
      const vector = new NotificationVector("LRNNAClCNArRLCAlrN", -2, "reload,reload,add:-2,change:-2,change:-2,add:-2", "reload,reload,add:-2,change:-2,change:-2,reload,add:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0026
     * @tc.name MatrixNotifications001_0026
     * @tc.desc Verify notifications input vector 26 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0026', 0, (): void => {
      const vector = new NotificationVector("LRACAClLCNARAlClrN", 7, "add:7,change:7,add:7,change:7,change:7,reload,add:7,add:7", "add:7,change:7,add:7,change:7,change:7,reload,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0027
     * @tc.name MatrixNotifications001_0027
     * @tc.desc Verify notifications input vector 27 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0027', 0, (): void => {
      const vector = new NotificationVector("LRRNNAClrLNLNrNlrN", 1, "reload,reload,add:1,change:1,reload,reload,reload", "reload,reload,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0028
     * @tc.name MatrixNotifications001_0028
     * @tc.desc Verify notifications input vector 28 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0028', 0, (): void => {
      const vector = new NotificationVector("RACAClNACRAlClrN", 1024, "", "add:1024,change:1024,add:1024,change:1024,reload,add:1024,change:1024,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0029
     * @tc.name MatrixNotifications001_0029
     * @tc.desc Verify notifications input vector 29 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0029', 0, (): void => {
      const vector = new NotificationVector("LCCArlRArRLCAlrN", 2, "change:2,change:2,add:2,change:2,add:2", "add:2,change:2,add:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0030
     * @tc.name MatrixNotifications001_0030
     * @tc.desc Verify notifications input vector 30 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0030', 0, (): void => {
      const vector = new NotificationVector("LRRAAClRNRAlClrN", 0, "add:0,add:0,change:0", "add:0,add:0,change:0,reload,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0031
     * @tc.name MatrixNotifications001_0031
     * @tc.desc Verify notifications input vector 31 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0031', 0, (): void => {
      const vector = new NotificationVector("RLNNACrLNACRAlClrN", 1, "reload,reload,add:1,change:1,reload,add:1,change:1,add:1", "reload,reload,add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0032
     * @tc.name MatrixNotifications001_0032
     * @tc.desc Verify notifications input vector 32 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0032', 0, (): void => {
      const vector = new NotificationVector("LNACrLNlLRAClrN", 0, "reload,add:0,change:0,reload,add:0,change:0", "add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0033
     * @tc.name MatrixNotifications001_0033
     * @tc.desc Verify notifications input vector 33 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0033', 0, (): void => {
      const vector = new NotificationVector("LLRCNAlRNACLNrNlrN", 0, "change:0,reload,add:0,reload,reload", "change:0,reload,add:0,reload,add:0,change:0,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0034
     * @tc.name MatrixNotifications001_0034
     * @tc.desc Verify notifications input vector 34 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0034', 0, (): void => {
      const vector = new NotificationVector("LRRCNAlLArRLCAlrN", 0, "change:0,reload,add:0,add:0,change:0,add:0", "change:0,reload,add:0,add:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0035
     * @tc.name MatrixNotifications001_0035
     * @tc.desc Verify notifications input vector 35 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0035', 0, (): void => {
      const vector = new NotificationVector("LRAAClLCNArRLCAlrN", -2, "add:-2,add:-2,change:-2,change:-2,reload,add:-2,change:-2,add:-2", "add:-2,add:-2,change:-2,change:-2,reload,add:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0036
     * @tc.name MatrixNotifications001_0036
     * @tc.desc Verify notifications input vector 36 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0036', 0, (): void => {
      const vector = new NotificationVector("LRRACNlCNAlLRAClrN", 7, "add:7,change:7,reload,add:7,change:7", "add:7,change:7,reload,change:7,reload,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0037
     * @tc.name MatrixNotifications001_0037
     * @tc.desc Verify notifications input vector 37 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0037', 0, (): void => {
      const vector = new NotificationVector("LLRNAClLCNARAlClrN", -2, "reload,add:-2,change:-2,change:-2,reload,add:-2,add:-2", "reload,add:-2,change:-2,change:-2,reload,add:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0038
     * @tc.name MatrixNotifications001_0038
     * @tc.desc Verify notifications input vector 38 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0038', 0, (): void => {
      const vector = new NotificationVector("LRRAAClrLALNrNlrN", 0, "add:0,add:0,change:0,add:0,reload,reload", "add:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0039
     * @tc.name MatrixNotifications001_0039
     * @tc.desc Verify notifications input vector 39 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0039', 0, (): void => {
      const vector = new NotificationVector("LCCArRAlLRAClrN", 7, "change:7,change:7,add:7,add:7,add:7,change:7", "add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0040
     * @tc.name MatrixNotifications001_0040
     * @tc.desc Verify notifications input vector 40 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0040', 0, (): void => {
      const vector = new NotificationVector("LRRCCAlrLNACrRLCAlrN", 7, "change:7,change:7,add:7,reload,add:7,change:7,change:7,add:7", "change:7,change:7,add:7,change:7,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0041
     * @tc.name MatrixNotifications001_0041
     * @tc.desc Verify notifications input vector 41 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0041', 0, (): void => {
      const vector = new NotificationVector("LCAANrLNACRAlClrN", 31, "change:31,add:31,add:31,reload,reload,add:31,change:31,add:31", "add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0042
     * @tc.name MatrixNotifications001_0042
     * @tc.desc Verify notifications input vector 42 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0042', 0, (): void => {
      const vector = new NotificationVector("LRACACrLArRLCAlrN", 7, "add:7,change:7,add:7,change:7,add:7,change:7,add:7", "add:7,change:7,add:7,change:7,change:7,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0043
     * @tc.name MatrixNotifications001_0043
     * @tc.desc Verify notifications input vector 43 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0043', 0, (): void => {
      const vector = new NotificationVector("LRCCArlRCNArRLCAlrN", -1, "change:-1,change:-1,add:-1,change:-1,add:-1", "change:-1,change:-1,add:-1,change:-1,reload,add:-1,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0044
     * @tc.name MatrixNotifications001_0044
     * @tc.desc Verify notifications input vector 44 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0044', 0, (): void => {
      const vector = new NotificationVector("RAAClCNAlLRAClrN", -2, "add:-2,change:-2", "add:-2,add:-2,change:-2,change:-2,reload,add:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0045
     * @tc.name MatrixNotifications001_0045
     * @tc.desc Verify notifications input vector 45 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0045', 0, (): void => {
      const vector = new NotificationVector("LRRACNrlRAAClLRAClrN", -2, "add:-2,change:-2,reload,add:-2,change:-2", "add:-2,change:-2,reload,add:-2,add:-2,change:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0046
     * @tc.name MatrixNotifications001_0046
     * @tc.desc Verify notifications input vector 46 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0046', 0, (): void => {
      const vector = new NotificationVector("RLCCArlRARAlClrN", 31, "change:31,change:31,add:31", "change:31,change:31,add:31,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0047
     * @tc.name MatrixNotifications001_0047
     * @tc.desc Verify notifications input vector 47 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0047', 0, (): void => {
      const vector = new NotificationVector("LLRCNArRCNArRLCAlrN", -2, "change:-2,reload,add:-2,change:-2,reload,add:-2,change:-2,add:-2", "change:-2,reload,add:-2,change:-2,reload,add:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0048
     * @tc.name MatrixNotifications001_0048
     * @tc.desc Verify notifications input vector 48 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0048', 0, (): void => {
      const vector = new NotificationVector("LRRCAANrNAClLRAClrN", 1024, "change:1024,add:1024,add:1024,reload,reload,add:1024,change:1024,add:1024,change:1024", "change:1024,add:1024,add:1024,reload,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0049
     * @tc.name MatrixNotifications001_0049
     * @tc.desc Verify notifications input vector 49 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0049', 0, (): void => {
      const vector = new NotificationVector("LRCAANrlRArRLCAlrN", 1024, "change:1024,add:1024,add:1024,reload,change:1024,add:1024", "change:1024,add:1024,add:1024,reload,add:1024,change:1024,add:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0050
     * @tc.name MatrixNotifications001_0050
     * @tc.desc Verify notifications input vector 50 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0050', 0, (): void => {
      const vector = new NotificationVector("LRRNACrAACrRLCAlrN", 0, "reload,add:0,change:0,add:0,add:0,change:0,change:0,add:0", "reload,add:0,change:0,change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0051
     * @tc.name MatrixNotifications001_0051
     * @tc.desc Verify notifications input vector 51 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0051', 0, (): void => {
      const vector = new NotificationVector("RNNAClLClLRAClrN", -1, "change:-1,add:-1,change:-1", "reload,reload,add:-1,change:-1,change:-1,add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0052
     * @tc.name MatrixNotifications001_0052
     * @tc.desc Verify notifications input vector 52 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0052', 0, (): void => {
      const vector = new NotificationVector("LRCCAlLNrRLCAlrN", -1, "change:-1,change:-1,add:-1,reload,change:-1,add:-1", "change:-1,change:-1,add:-1,reload,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0053
     * @tc.name MatrixNotifications001_0053
     * @tc.desc Verify notifications input vector 53 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0053', 0, (): void => {
      const vector = new NotificationVector("LLRCCAlLALNrNlrN", 31, "change:31,change:31,add:31,add:31,reload,reload", "change:31,change:31,add:31,add:31,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0054
     * @tc.name MatrixNotifications001_0054
     * @tc.desc Verify notifications input vector 54 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0054', 0, (): void => {
      const vector = new NotificationVector("LRCNArLNACrRLCAlrN", -2, "change:-2,reload,add:-2,reload,add:-2,change:-2,change:-2,add:-2", "change:-2,reload,add:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0055
     * @tc.name MatrixNotifications001_0055
     * @tc.desc Verify notifications input vector 55 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0055', 0, (): void => {
      const vector = new NotificationVector("RCAANrRNACRAlClrN", 2, "", "change:2,add:2,add:2,reload,reload,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0056
     * @tc.name MatrixNotifications001_0056
     * @tc.desc Verify notifications input vector 56 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0056', 0, (): void => {
      const vector = new NotificationVector("RLNAClRNACRAlClrN", 31, "reload,add:31,change:31", "reload,add:31,change:31,reload,add:31,change:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0057
     * @tc.name MatrixNotifications001_0057
     * @tc.desc Verify notifications input vector 57 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0057', 0, (): void => {
      const vector = new NotificationVector("LRCAANlrLCRAlClrN", 1, "change:1,add:1,add:1,reload,change:1,add:1", "change:1,add:1,add:1,reload,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0058
     * @tc.name MatrixNotifications001_0058
     * @tc.desc Verify notifications input vector 58 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0058', 0, (): void => {
      const vector = new NotificationVector("LCCAlRNACLNrNlrN", 0, "change:0,change:0,add:0,reload,reload", "reload,add:0,change:0,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0059
     * @tc.name MatrixNotifications001_0059
     * @tc.desc Verify notifications input vector 59 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0059', 0, (): void => {
      const vector = new NotificationVector("LCCAlrLArRLCAlrN", 0, "change:0,change:0,add:0,add:0,change:0,add:0", "change:0,add:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0060
     * @tc.name MatrixNotifications001_0060
     * @tc.desc Verify notifications input vector 60 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0060', 0, (): void => {
      const vector = new NotificationVector("RNAClRCNALNrNlrN", 7, "reload,reload", "reload,add:7,change:7,change:7,reload,add:7,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0061
     * @tc.name MatrixNotifications001_0061
     * @tc.desc Verify notifications input vector 61 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0061', 0, (): void => {
      const vector = new NotificationVector("LRCCAlrLCNARAlClrN", 7, "change:7,change:7,add:7,change:7,reload,add:7,add:7", "change:7,change:7,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0062
     * @tc.name MatrixNotifications001_0062
     * @tc.desc Verify notifications input vector 62 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0062', 0, (): void => {
      const vector = new NotificationVector("RLCCArRCNALNrNlrN", 1024, "change:1024,change:1024,add:1024,change:1024,reload,add:1024,reload,reload", "change:1024,change:1024,add:1024,change:1024,reload,add:1024,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0063
     * @tc.name MatrixNotifications001_0063
     * @tc.desc Verify notifications input vector 63 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0063', 0, (): void => {
      const vector = new NotificationVector("LRRACNrLAACrRLCAlrN", 1, "add:1,change:1,reload,add:1,add:1,change:1,change:1,add:1", "add:1,change:1,reload,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0064
     * @tc.name MatrixNotifications001_0064
     * @tc.desc Verify notifications input vector 64 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0064', 0, (): void => {
      const vector = new NotificationVector("LRCCAlLCNARAlClrN", 0, "change:0,change:0,add:0,change:0,reload,add:0,add:0", "change:0,change:0,add:0,change:0,reload,add:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0065
     * @tc.name MatrixNotifications001_0065
     * @tc.desc Verify notifications input vector 65 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0065', 0, (): void => {
      const vector = new NotificationVector("RLACACrlRARAlClrN", 31, "add:31,change:31,add:31,change:31", "add:31,change:31,add:31,change:31,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0066
     * @tc.name MatrixNotifications001_0066
     * @tc.desc Verify notifications input vector 66 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0066', 0, (): void => {
      const vector = new NotificationVector("RNACrlRALNrNlrN", 2, "reload,reload", "reload,add:2,change:2,add:2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0067
     * @tc.name MatrixNotifications001_0067
     * @tc.desc Verify notifications input vector 67 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0067', 0, (): void => {
      const vector = new NotificationVector("RCNAlLNACLNrNlrN", 7, "reload,add:7,change:7,reload,reload", "change:7,reload,add:7,reload,add:7,change:7,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0068
     * @tc.name MatrixNotifications001_0068
     * @tc.desc Verify notifications input vector 68 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0068', 0, (): void => {
      const vector = new NotificationVector("LCAANlrLNAClLRAClrN", -1, "change:-1,add:-1,add:-1,reload,reload,add:-1,change:-1,add:-1,change:-1", "add:-1,change:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0069
     * @tc.name MatrixNotifications001_0069
     * @tc.desc Verify notifications input vector 69 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0069', 0, (): void => {
      const vector = new NotificationVector("LACNrlRCRAlClrN", 2, "add:2,change:2,reload", "change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0070
     * @tc.name MatrixNotifications001_0070
     * @tc.desc Verify notifications input vector 70 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0070', 0, (): void => {
      const vector = new NotificationVector("RACNlLCrRLCAlrN", -2, "change:-2,change:-2,add:-2", "add:-2,change:-2,reload,change:-2,change:-2,add:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0071
     * @tc.name MatrixNotifications001_0071
     * @tc.desc Verify notifications input vector 71 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0071', 0, (): void => {
      const vector = new NotificationVector("LRRCAANrNACRAlClrN", 2, "change:2,add:2,add:2,reload,reload,add:2,change:2,add:2", "change:2,add:2,add:2,reload,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0072
     * @tc.name MatrixNotifications001_0072
     * @tc.desc Verify notifications input vector 72 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0072', 0, (): void => {
      const vector = new NotificationVector("RAAClNLNrNlrN", 7, "reload,reload", "add:7,add:7,change:7,reload,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0073
     * @tc.name MatrixNotifications001_0073
     * @tc.desc Verify notifications input vector 73 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0073', 0, (): void => {
      const vector = new NotificationVector("LRRNNACrRCNALNrNlrN", 31, "reload,reload,add:31,change:31,change:31,reload,add:31,reload,reload", "reload,reload,add:31,change:31,change:31,reload,add:31,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0074
     * @tc.name MatrixNotifications001_0074
     * @tc.desc Verify notifications input vector 74 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0074', 0, (): void => {
      const vector = new NotificationVector("LRRACNrLCNAlLRAClrN", 31, "add:31,change:31,reload,change:31,reload,add:31,add:31,change:31", "add:31,change:31,reload,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0075
     * @tc.name MatrixNotifications001_0075
     * @tc.desc Verify notifications input vector 75 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0075', 0, (): void => {
      const vector = new NotificationVector("LRRACACrNACLNrNlrN", 0, "add:0,change:0,add:0,change:0,reload,add:0,change:0,reload,reload", "add:0,change:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0076
     * @tc.name MatrixNotifications001_0076
     * @tc.desc Verify notifications input vector 76 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0076', 0, (): void => {
      const vector = new NotificationVector("LRRACAClrLCLNrNlrN", 1, "add:1,change:1,add:1,change:1,change:1,reload,reload", "add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0077
     * @tc.name MatrixNotifications001_0077
     * @tc.desc Verify notifications input vector 77 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0077', 0, (): void => {
      const vector = new NotificationVector("RCAANrLNACLNrNlrN", 31, "reload,add:31,change:31,reload,reload", "change:31,add:31,add:31,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0078
     * @tc.name MatrixNotifications001_0078
     * @tc.desc Verify notifications input vector 78 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0078', 0, (): void => {
      const vector = new NotificationVector("LRACAClRNACLNrNlrN", -1, "add:-1,change:-1,add:-1,change:-1,reload,reload", "add:-1,change:-1,add:-1,change:-1,reload,add:-1,change:-1,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0079
     * @tc.name MatrixNotifications001_0079
     * @tc.desc Verify notifications input vector 79 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0079', 0, (): void => {
      const vector = new NotificationVector("RNACrlRCLNrNlrN", -2, "reload,reload", "reload,add:-2,change:-2,change:-2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0080
     * @tc.name MatrixNotifications001_0080
     * @tc.desc Verify notifications input vector 80 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0080', 0, (): void => {
      const vector = new NotificationVector("LRACNlNAClLRAClrN", 1, "add:1,change:1,reload,add:1,change:1", "add:1,change:1,reload,reload,add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0081
     * @tc.name MatrixNotifications001_0081
     * @tc.desc Verify notifications input vector 81 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0081', 0, (): void => {
      const vector = new NotificationVector("RCCArlRNACRAlClrN", -2, "", "change:-2,change:-2,add:-2,reload,add:-2,change:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0082
     * @tc.name MatrixNotifications001_0082
     * @tc.desc Verify notifications input vector 82 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0082', 0, (): void => {
      const vector = new NotificationVector("RLCCArRALNrNlrN", 2, "change:2,change:2,add:2,add:2,reload,reload", "change:2,change:2,add:2,add:2,reload");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0083
     * @tc.name MatrixNotifications001_0083
     * @tc.desc Verify notifications input vector 83 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0083', 0, (): void => {
      const vector = new NotificationVector("RCAANlRCrRLCAlrN", 31, "change:31,add:31", "change:31,add:31,add:31,reload,change:31,change:31,add:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0084
     * @tc.name MatrixNotifications001_0084
     * @tc.desc Verify notifications input vector 84 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0084', 0, (): void => {
      const vector = new NotificationVector("RCNAlRCrRLCAlrN", 1, "change:1,add:1", "change:1,reload,add:1,change:1,change:1,add:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0085
     * @tc.name MatrixNotifications001_0085
     * @tc.desc Verify notifications input vector 85 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0085', 0, (): void => {
      const vector = new NotificationVector("LRRACNrlRARAlClrN", 2, "add:2,change:2,reload", "add:2,change:2,reload,add:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0086
     * @tc.name MatrixNotifications001_0086
     * @tc.desc Verify notifications input vector 86 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0086', 0, (): void => {
      const vector = new NotificationVector("RLNNAClLNlLRAClrN", 1024, "reload,reload,add:1024,change:1024,reload,add:1024,change:1024", "reload,reload,add:1024,change:1024,reload,add:1024,change:1024");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0087
     * @tc.name MatrixNotifications001_0087
     * @tc.desc Verify notifications input vector 87 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0087', 0, (): void => {
      const vector = new NotificationVector("RCCAlLNAClLRAClrN", 2, "reload,add:2,change:2,add:2,change:2", "change:2,change:2,add:2,reload,add:2,change:2,add:2,change:2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0088
     * @tc.name MatrixNotifications001_0088
     * @tc.desc Verify notifications input vector 88 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0088', 0, (): void => {
      const vector = new NotificationVector("RACACrLAACrRLCAlrN", -1, "add:-1,add:-1,change:-1,change:-1,add:-1", "add:-1,change:-1,add:-1,change:-1,change:-1,add:-1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0089
     * @tc.name MatrixNotifications001_0089
     * @tc.desc Verify notifications input vector 89 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0089', 0, (): void => {
      const vector = new NotificationVector("RCCArlRCNARAlClrN", 1, "", "change:1,change:1,add:1,change:1,reload,add:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0090
     * @tc.name MatrixNotifications001_0090
     * @tc.desc Verify notifications input vector 90 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0090', 0, (): void => {
      const vector = new NotificationVector("LRCAANrlRARAlClrN", 31, "change:31,add:31,add:31,reload", "change:31,add:31,add:31,reload,add:31,add:31,change:31");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0091
     * @tc.name MatrixNotifications001_0091
     * @tc.desc Verify notifications input vector 91 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0091', 0, (): void => {
      const vector = new NotificationVector("LAACrlRNACRAlClrN", 1, "add:1,add:1,change:1", "reload,add:1,change:1,add:1,change:1");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0092
     * @tc.name MatrixNotifications001_0092
     * @tc.desc Verify notifications input vector 92 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0092', 0, (): void => {
      const vector = new NotificationVector("LRRCNAlRCNArRLCAlrN", 7, "change:7,reload,add:7,change:7,add:7", "change:7,reload,add:7,change:7,reload,add:7,change:7,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0093
     * @tc.name MatrixNotifications001_0093
     * @tc.desc Verify notifications input vector 93 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0093', 0, (): void => {
      const vector = new NotificationVector("LRACNlrLNACRAlClrN", -2, "add:-2,change:-2,reload,reload,add:-2,change:-2,add:-2", "add:-2,change:-2,reload,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0094
     * @tc.name MatrixNotifications001_0094
     * @tc.desc Verify notifications input vector 94 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0094', 0, (): void => {
      const vector = new NotificationVector("LRRACNlRNlLRAClrN", -2, "add:-2,change:-2,reload,add:-2,change:-2", "add:-2,change:-2,reload,reload,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0095
     * @tc.name MatrixNotifications001_0095
     * @tc.desc Verify notifications input vector 95 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0095', 0, (): void => {
      const vector = new NotificationVector("RLAACrLClLRAClrN", 0, "add:0,add:0,change:0,change:0,add:0,change:0", "add:0,add:0,change:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0096
     * @tc.name MatrixNotifications001_0096
     * @tc.desc Verify notifications input vector 96 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0096', 0, (): void => {
      const vector = new NotificationVector("RNACrlRCNARAlClrN", 0, "", "reload,add:0,change:0,change:0,reload,add:0,add:0,change:0");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0097
     * @tc.name MatrixNotifications001_0097
     * @tc.desc Verify notifications input vector 97 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0097', 0, (): void => {
      const vector = new NotificationVector("LRRCNAlrLAACLNrNlrN", 7, "change:7,reload,add:7,add:7,add:7,change:7,reload,reload", "change:7,reload,add:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0098
     * @tc.name MatrixNotifications001_0098
     * @tc.desc Verify notifications input vector 98 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0098', 0, (): void => {
      const vector = new NotificationVector("LRRNACrlRAlLRAClrN", 7, "reload,add:7,change:7,add:7,change:7", "reload,add:7,change:7,add:7,add:7,change:7");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0099
     * @tc.name MatrixNotifications001_0099
     * @tc.desc Verify notifications input vector 99 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0099', 0, (): void => {
      const vector = new NotificationVector("LRRNNAClrLCRAlClrN", -2, "reload,reload,add:-2,change:-2,change:-2,add:-2", "reload,reload,add:-2,change:-2,add:-2,change:-2");
      verifyNotification(vector);
    });

    /**
     * @tc.number SUB_SHORTVIDEO_MATRIXNOTIFICATIONS001_0100
     * @tc.name MatrixNotifications001_0100
     * @tc.desc Verify notifications input vector 100 against independent expectations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level Level 2
     */
    it('MatrixNotifications001_0100', 0, (): void => {
      const vector = new NotificationVector("LLRCAANlClLRAClrN", 0, "change:0,add:0,add:0,reload,add:0,change:0", "change:0,add:0,add:0,reload,change:0,add:0,change:0");
      verifyNotification(vector);
    });

  });
}
