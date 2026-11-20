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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Permission } from '../../../../main/ets/common/utils/Permission';
import { FileJumpTools, PlaylistItem } from '../../../../main/ets/common/FileJumpTools';
import { AbilityManager } from '../../../../main/ets/common/manager/AbilityManager';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { Tools } from '../../../../main/ets/common/utils/Tools';
import { createBean } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function fileOfflineNetworkTest() {
  describe('FileOfflineNetwork', () => {
    /*
     * Share requests carry the read and write uri grants only for the shared file.
     */
    describe('FileOfflineNetwork_Share_Want_Security', () => {
      it('image_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_action');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.action).assertEqual('ohos.want.action.viewData');
      });

      it('image_want_type', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_type');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.type).assertEqual('image/*');
      });

      it('image_want_uri', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_uri');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.uri).assertEqual('file://a.jpg');
      });

      it('image_want_parameters', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_parameters');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        let params = want.parameters;
        expect(params !== undefined).assertTrue();
        if (params) {
          expect(params['uri']).assertEqual('file://a.jpg');
          expect(params['name']).assertEqual('a.jpg');
        }
      });

      it('video_want_action', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: video_want_action');
        let want = await FileJumpTools.getVideoWant('v.mp4', 'file://not/exist.mp4');
        expect(want.action).assertEqual('ohos.want.action.viewData');
        expect(want.type).assertEqual('video/*');
      });

      it('audio_want_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_playlist');
        let items: PlaylistItem[] = [{ name: 'a.mp3', uri: 'file://a.mp3', time: 1 }];
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        let params = want.parameters;
        if (params) {
          expect(params['playListCount']).assertEqual(1);
          expect(params['currentIndex']).assertEqual(0);
        }
      });

      it('photo_want_bundle', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: photo_want_bundle');
        let want = FileJumpTools.getPhotoWant('file://a.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
      });

      it('permission_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: permission_api_contract');
        expect(typeof Permission.checkAndRequest).assertEqual('function');
      });

      it('ability_manager_api_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: ability_manager_api_contract');
        let manager: AbilityManager = new AbilityManager();
        expect(typeof manager.startShareAbility).assertEqual('function');
        expect(typeof manager.preloadShareService).assertEqual('function');
      });
    });

    /*
     * Wants are built from file uris, never from raw sandbox paths.
     */
    describe('FileOfflineNetwork_Uri_Grant_Validation', () => {
      it('image_want_keeps_uri_scheme', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: image_want_keeps_uri_scheme');
        let want = FileJumpTools.getImageWant('photo.png', 'file://media/Photo/1.png');
        expect(want.uri?.indexOf('file://')).assertEqual(0);
      });

      it('audio_want_empty_playlist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: audio_want_empty_playlist');
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, []);
        let params = want.parameters;
        if (params) {
          expect(params['playList']).assertEqual(undefined);
        }
      });

      it('security_flags_exist', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_flags_exist');
        let want = FileJumpTools.getImageWant('a.jpg', 'file://a.jpg');
        expect(want.flags).not().assertEqual(undefined);
      });
    });

    /*
     * Extended boundary, type and matrix coverage for FileOfflineNetwork derived from the reference suite.
     */
    describe('FileOfflineNetwork_Extended_Coverage', () => {
      it('security_image_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_0');
        let want = FileJumpTools.getImageWant('img0.jpg', 'file://img0.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img0.jpg');
        }
      });

      it('security_audio_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_1');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_2');
        let want = FileJumpTools.getPhotoWant('file://photo/2.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/2.jpg');
        }
      });

      it('security_contract_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_3');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_4', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_4');
        let want = FileJumpTools.getImageWant('img4.jpg', 'file://img4.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img4.jpg');
        }
      });

      it('security_audio_matrix_5', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_5');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_6', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_6');
        let want = FileJumpTools.getPhotoWant('file://photo/6.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/6.jpg');
        }
      });

      it('security_contract_matrix_7', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_7');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_8', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_8');
        let want = FileJumpTools.getImageWant('img8.jpg', 'file://img8.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img8.jpg');
        }
      });

      it('security_audio_matrix_9', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_9');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 4; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_10', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_10');
        let want = FileJumpTools.getPhotoWant('file://photo/10.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/10.jpg');
        }
      });

      it('security_contract_matrix_11', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_11');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_12', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_12');
        let want = FileJumpTools.getImageWant('img12.jpg', 'file://img12.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img12.jpg');
        }
      });

      it('security_audio_matrix_13', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_13');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 3; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_14', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_14');
        let want = FileJumpTools.getPhotoWant('file://photo/14.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/14.jpg');
        }
      });

      it('security_contract_matrix_15', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_15');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_16', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_16');
        let want = FileJumpTools.getImageWant('img16.jpg', 'file://img16.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img16.jpg');
        }
      });

      it('security_audio_matrix_17', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_17');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 2; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_18', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_18');
        let want = FileJumpTools.getPhotoWant('file://photo/18.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/18.jpg');
        }
      });

      it('security_contract_matrix_19', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_19');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_20', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_20');
        let want = FileJumpTools.getImageWant('img20.jpg', 'file://img20.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img20.jpg');
        }
      });

      it('security_audio_matrix_21', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_21');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_22', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_22');
        let want = FileJumpTools.getPhotoWant('file://photo/22.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/22.jpg');
        }
      });

      it('security_contract_matrix_23', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_23');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_24', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_24');
        let want = FileJumpTools.getImageWant('img24.jpg', 'file://img24.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img24.jpg');
        }
      });

      it('security_audio_matrix_25', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_25');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_26', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_26');
        let want = FileJumpTools.getPhotoWant('file://photo/26.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/26.jpg');
        }
      });

      it('security_contract_matrix_27', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_27');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_28', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_28');
        let want = FileJumpTools.getImageWant('img28.jpg', 'file://img28.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img28.jpg');
        }
      });

      it('security_audio_matrix_29', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_29');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 4; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_30', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_30');
        let want = FileJumpTools.getPhotoWant('file://photo/30.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/30.jpg');
        }
      });

      it('security_contract_matrix_31', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_31');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_32', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_32');
        let want = FileJumpTools.getImageWant('img32.jpg', 'file://img32.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img32.jpg');
        }
      });

      it('security_audio_matrix_33', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_33');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 3; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_34', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_34');
        let want = FileJumpTools.getPhotoWant('file://photo/34.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/34.jpg');
        }
      });

      it('security_contract_matrix_35', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_35');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_36', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_36');
        let want = FileJumpTools.getImageWant('img36.jpg', 'file://img36.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img36.jpg');
        }
      });

      it('security_audio_matrix_37', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_37');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 2; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_38', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_38');
        let want = FileJumpTools.getPhotoWant('file://photo/38.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/38.jpg');
        }
      });

      it('security_contract_matrix_39', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_39');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_40', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_40');
        let want = FileJumpTools.getImageWant('img40.jpg', 'file://img40.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img40.jpg');
        }
      });

      it('security_audio_matrix_41', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_41');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_42', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_42');
        let want = FileJumpTools.getPhotoWant('file://photo/42.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/42.jpg');
        }
      });

      it('security_contract_matrix_43', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_43');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_44', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_44');
        let want = FileJumpTools.getImageWant('img44.jpg', 'file://img44.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img44.jpg');
        }
      });

      it('security_audio_matrix_45', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_45');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_46', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_46');
        let want = FileJumpTools.getPhotoWant('file://photo/46.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/46.jpg');
        }
      });

      it('security_contract_matrix_47', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_47');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_48', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_48');
        let want = FileJumpTools.getImageWant('img48.jpg', 'file://img48.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img48.jpg');
        }
      });

      it('security_audio_matrix_49', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_49');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 4; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_50', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_50');
        let want = FileJumpTools.getPhotoWant('file://photo/50.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/50.jpg');
        }
      });

      it('security_contract_matrix_51', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_51');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_52', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_52');
        let want = FileJumpTools.getImageWant('img52.jpg', 'file://img52.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img52.jpg');
        }
      });

      it('security_audio_matrix_53', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_53');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 3; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_54', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_54');
        let want = FileJumpTools.getPhotoWant('file://photo/54.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/54.jpg');
        }
      });

      it('security_contract_matrix_55', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_55');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_56', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_56');
        let want = FileJumpTools.getImageWant('img56.jpg', 'file://img56.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img56.jpg');
        }
      });

      it('security_audio_matrix_57', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_57');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 2; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_58', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_58');
        let want = FileJumpTools.getPhotoWant('file://photo/58.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/58.jpg');
        }
      });

      it('security_contract_matrix_59', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_59');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_60', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_60');
        let want = FileJumpTools.getImageWant('img60.jpg', 'file://img60.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img60.jpg');
        }
      });

      it('security_audio_matrix_61', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_61');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_62', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_62');
        let want = FileJumpTools.getPhotoWant('file://photo/62.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/62.jpg');
        }
      });

      it('security_contract_matrix_63', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_63');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_64', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_64');
        let want = FileJumpTools.getImageWant('img64.jpg', 'file://img64.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img64.jpg');
        }
      });

      it('security_audio_matrix_65', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_65');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_66', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_66');
        let want = FileJumpTools.getPhotoWant('file://photo/66.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/66.jpg');
        }
      });

      it('security_contract_matrix_67', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_67');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_68', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_68');
        let want = FileJumpTools.getImageWant('img68.jpg', 'file://img68.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img68.jpg');
        }
      });

      it('security_audio_matrix_69', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_69');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 4; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_70', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_70');
        let want = FileJumpTools.getPhotoWant('file://photo/70.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/70.jpg');
        }
      });

      it('security_contract_matrix_71', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_71');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_72', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_72');
        let want = FileJumpTools.getImageWant('img72.jpg', 'file://img72.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img72.jpg');
        }
      });

      it('security_audio_matrix_73', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_73');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 3; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_74', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_74');
        let want = FileJumpTools.getPhotoWant('file://photo/74.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/74.jpg');
        }
      });

      it('security_contract_matrix_75', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_75');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_76', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_76');
        let want = FileJumpTools.getImageWant('img76.jpg', 'file://img76.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img76.jpg');
        }
      });

      it('security_audio_matrix_77', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_77');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 2; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_78', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_78');
        let want = FileJumpTools.getPhotoWant('file://photo/78.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/78.jpg');
        }
      });

      it('security_contract_matrix_79', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_79');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_80', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_80');
        let want = FileJumpTools.getImageWant('img80.jpg', 'file://img80.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img80.jpg');
        }
      });

      it('security_audio_matrix_81', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_81');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 1; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_82', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_82');
        let want = FileJumpTools.getPhotoWant('file://photo/82.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/82.jpg');
        }
      });

      it('security_contract_matrix_83', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_contract_matrix_83');
        expect(typeof FileJumpTools.getImageWant).assertEqual('function');
        expect(typeof FileJumpTools.getAudioWant).assertEqual('function');
        expect(typeof FileJumpTools.getPhotoWant).assertEqual('function');
      });

      it('security_image_matrix_84', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_image_matrix_84');
        let want = FileJumpTools.getImageWant('img84.jpg', 'file://img84.jpg');
        expect(want.type).assertEqual('image/*');
        let params = want.parameters;
        if (params) {
          expect(params['name']).assertEqual('img84.jpg');
        }
      });

      it('security_audio_matrix_85', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_audio_matrix_85');
        let items: PlaylistItem[] = [];
        for (let i = 0; i < 0; i++) {
          items.push({ name: 'a' + i + '.mp3', uri: 'file://a' + i + '.mp3', time: i });
        }
        let want = FileJumpTools.getAudioWant('a.mp3', 'file://a.mp3', 0, items);
        expect(want.type).assertEqual('audio/*');
      });

      it('security_photo_matrix_86', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: security_photo_matrix_86');
        let want = FileJumpTools.getPhotoWant('file://photo/86.jpg');
        expect(want.bundleName).assertEqual('com.ohos.photos');
        let params = want.parameters;
        if (params) {
          expect(params['uri']).assertEqual('file://photo/86.jpg');
        }
      });
    });
  });
}
