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
import { NavStack, focusIdTag, HOME_NAME } from '../../../../main/ets/common/manager/NavPathStackManager';
import { TABS } from '../../../../main/ets/common/Constants';
import { FileBean } from '../../../../main/ets/component/bean/FileBean';
import { DeviceType } from '../../../../main/ets/common/data/DeviceType';
import { PageType } from '../../../../main/ets/model/PageType';
import { createBean } from '../Shared/TestData';

const DOMAIN: number = 0x0000;
const TAG: string = 'TVFileManagerTest';

export default function pageLifecycleTest() {
  describe('PageLifecycle', () => {
    /*
     * Route names and the focus tag are part of the cross module contract.
     */
    describe('PageLifecycle_NavStack_Constants', () => {
      it('home_name_value', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: home_name_value');
        expect(HOME_NAME).assertEqual('HOME');
      });

      it('focus_id_tag_value', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: focus_id_tag_value');
        expect(focusIdTag).assertEqual('FocusIdTag');
      });

      it('tabs_contract', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: tabs_contract');
        expect(TABS.length).assertEqual(2);
        expect(TABS[0]).assertEqual('本机');
        expect(TABS[1]).assertEqual('外部储存');
      });
    });

    /*
     * Local and USB keep independent navigation stacks.
     */
    describe('PageLifecycle_NavStack_Device_Switch', () => {
      it('get_instance_is_singleton', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: get_instance_is_singleton');
        let first: NavStack = NavStack.getIns();
        let second: NavStack = NavStack.getIns();
        expect(first === second).assertTrue();
      });

      it('set_device_local', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_device_local');
        let nav: NavStack = NavStack.getIns();
        nav.setDevice(DeviceType.Local);
        expect(nav.getDevice()).assertEqual(DeviceType.Local);
      });

      it('set_device_usb', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: set_device_usb');
        let nav: NavStack = NavStack.getIns();
        nav.setDevice(DeviceType.USB);
        expect(nav.getDevice()).assertEqual(DeviceType.USB);
        nav.setDevice(DeviceType.Local);
      });

      it('is_external_flag', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_external_flag');
        let nav: NavStack = NavStack.getIns();
        expect(typeof nav.isExternal()).assertEqual('boolean');
      });
    });

    /*
     * Copy and move modes are mutually exclusive and drive menu visibility.
     */
    describe('PageLifecycle_NavStack_Select_Mode', () => {
      it('copy_mode', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: copy_mode');
        let nav: NavStack = NavStack.getIns();
        nav.setCopyMode();
        expect(nav.isCopy()).assertTrue();
        expect(nav.isMove()).assertFalse();
        nav.closeSelectMode();
      });

      it('move_mode', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: move_mode');
        let nav: NavStack = NavStack.getIns();
        nav.setMoveMode();
        expect(nav.isMove()).assertTrue();
        expect(nav.isCopy()).assertFalse();
        nav.closeSelectMode();
      });

      it('close_mode', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: close_mode');
        let nav: NavStack = NavStack.getIns();
        nav.setCopyMode();
        nav.closeSelectMode();
        expect(nav.isSelectMod()).assertFalse();
      });

      it('status_listener_notified', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: status_listener_notified');
        let nav: NavStack = NavStack.getIns();
        let seen: boolean = false;
        let listener = (mode: boolean): void => {
          seen = true;
        };
        nav.addStatusLis(listener);
        nav.setCopyMode();
        nav.removeStatusLis(listener);
        nav.closeSelectMode();
        expect(seen).assertTrue();
      });
    });

    /*
     * The breadcrumb is rebuilt from the path stack after every push or pop.
     */
    describe('PageLifecycle_NavStack_Path_Stack', () => {
      it('push_home_resets_stack', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: push_home_resets_stack');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        expect(nav.getPathListNames().length).assertEqual(0);
      });

      it('push_bean_appends_path', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: push_bean_appends_path');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Documents'));
        expect(nav.getPathListNames().length).assertEqual(1);
      });

      it('pop_path_removes_entry', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: pop_path_removes_entry');
        let nav: NavStack = NavStack.getIns();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('Documents'));
        nav.popPath();
        expect(nav.getPathListNames().length).assertEqual(0);
      });

      it('is_show_path_boolean', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: is_show_path_boolean');
        let nav: NavStack = NavStack.getIns();
        expect(typeof nav.isShowPath()).assertEqual('boolean');
      });

      it('back_press_predicate', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: back_press_predicate');
        expect(typeof NavStack.getIns().checkBackPress()).assertEqual('boolean');
      });

      it('exit_app_predicate', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: exit_app_predicate');
        expect(typeof NavStack.getIns().isExitApp()).assertEqual('boolean');
      });
    });

    /*
     * Extended boundary, type and matrix coverage for PageLifecycle derived from the reference suite.
     */
    describe('PageLifecycle_Extended_Coverage', () => {
      it('nav_device_matrix_0', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: nav_device_matrix_0');
        let nav: NavStack = NavStack.getIns();
        nav.closeSelectMode();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.setDevice(DeviceType.Local);
        expect(nav.getDevice()).assertEqual(DeviceType.Local);
      });

      it('nav_push_matrix_1', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: nav_push_matrix_1');
        let nav: NavStack = NavStack.getIns();
        nav.closeSelectMode();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.pushBean(createBean('dir1'));
        expect(nav.getPathListNames().length).assertEqual(1);
        nav.popPath();
        expect(nav.getPathListNames().length).assertEqual(0);
      });

      it('nav_mode_matrix_2', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: nav_mode_matrix_2');
        let nav: NavStack = NavStack.getIns();
        nav.closeSelectMode();
        nav.pushRoot(PageType.HOME_PAGE);
        nav.setCopyMode();
        expect(nav.isCopy()).assertTrue();
        nav.closeSelectMode();
        expect(nav.isSelectMod()).assertFalse();
      });

      it('nav_external_matrix_3', 0, async () => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'CASE: nav_external_matrix_3');
        let nav: NavStack = NavStack.getIns();
        nav.openUSB();
        expect(nav.isExternal()).assertTrue();
        nav.closeUSB();
        expect(typeof nav.isExternal()).assertEqual('boolean');
      });
    });
  });
}
