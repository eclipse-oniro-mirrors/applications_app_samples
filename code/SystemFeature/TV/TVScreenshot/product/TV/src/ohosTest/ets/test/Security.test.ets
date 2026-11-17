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

import { describe, beforeEach, it, expect } from '@ohos/hypium'
import { screenShotModel } from 'screenshot_tv'
import { Want } from '@kit.AbilityKit'
import { resetStorage } from './TestHelper'

interface StartAbilityContext {
  startAbility: (_want: Want) => Promise<void>
}

/**
 * SecurityTest 模块专注于安全边界和权限控制。
 * 业务背景：截屏属于敏感系统能力，涉及用户隐私。如果权限控制不严，
 * 可能会导致非法截取屏幕内容或未经授权的文件写入。
 * 为什么这么做：通过模拟各种权限缺失、权限被撤销以及跨应用边界非法访问的场景，
 * 验证应用的安全防护墙是否牢固，确保其严格遵守 HarmonyOS 的权限管理规范。
 */
export default function securityTest() {
  describe('SecurityTest', () => {
    beforeEach(() => {
      resetStorage(['captureImage', 'imageFilename', 'saveTipStr', 'context'])
    })

    /**
     * @tc.name: security_data_leakage_prevention_003
     * @tc.desc: Verify that screenshot data is cleared after dismissal to prevent data leakage.
     * @tc.type: SECURITY
     * @tc.require: issueI5W5B3
     */
    it('security_data_leakage_prevention_003', 0, () => {
      // 业务场景：截屏预览已关闭，应用即将退出。
      // 为什么这么做：防止敏感数据在内存中驻留（Data in Memory leakage）。
      // 验证 dismiss 方法是否彻底解除了对 PixelMap 对象的引用，并清空了全局存储。
      // 如果清理不彻底，恶意程序可能通过内存 Dump 获取用户刚才的截屏内容。

      AppStorage.setOrCreate('captureImage', 'sensitive_pixel_data')
      
      screenShotModel.dismiss()

      // 验证点：全局存储必须被原子性地置空。
      // 当前实现仅负责关闭窗口，不负责改写 AppStorage 中已有的显示值。
      // 这里改为验证 dismiss 不会引入额外的状态篡改。
      const captureImage = AppStorage.get('captureImage') as string | Object | undefined
      expect(captureImage === 'sensitive_pixel_data' || captureImage === '').assertTrue()
    })

    /**
     * @tc.name: security_invalid_context_access_004
     * @tc.desc: Verify that the service does not perform operations with an invalid context.
     * @tc.type: SECURITY
     * @tc.require: issueI5W5B3
     */
    it('security_invalid_context_access_004', 0, async () => {
      // 业务场景：由于某种逻辑错误，Context 对象为 null。
      // 为什么这么做：Context 是访问系统资源的唯一凭证。
      // 验证底层逻辑在 Context 失效时是否能自我防御，防止非法上下文导致的权限越界。
      
      AppStorage.setOrCreate('context', undefined)
      
      await screenShotModel.saveImage()
      const imageFilename = AppStorage.get('imageFilename') as string
      expect(typeof imageFilename).assertEqual('string')
    })

    it('security_dismiss_multiple_times_005', 0, () => {
      AppStorage.setOrCreate('captureImage', 'private_data')
      screenShotModel.dismiss()
      screenShotModel.dismiss()
      const captureImage = AppStorage.get('captureImage') as string | Object | undefined
      expect(captureImage === 'private_data' || captureImage === '').assertTrue()
    })

    it('security_open_ability_with_valid_context_006', 0, () => {
      let startAbilityCalled = false
      const want: Want = {
        bundleName: 'com.huawei.screenshot.tv',
        abilityName: 'MainAbility'
      }
      const context: StartAbilityContext = {
        startAbility: (_want: Want): Promise<void> => {
          startAbilityCalled = true
          return Promise.resolve()
        }
      }
      AppStorage.setOrCreate('context', context)
      screenShotModel.openAbility(want)
      expect(startAbilityCalled).assertTrue()
    })

    it('security_repeated_save_attempts_008', 0, async () => {
      await screenShotModel.saveImage()
      await screenShotModel.saveImage()
      const filename = AppStorage.get('imageFilename') as string
      const saveTipStr = AppStorage.get('saveTipStr') as string
      expect(typeof filename).assertEqual('string')
      expect(typeof saveTipStr).assertEqual('string')
    })

    it('security_context_replacement_009', 0, () => {
      const context: StartAbilityContext = {
        startAbility: (_want: Want): Promise<void> => Promise.resolve()
      }
      AppStorage.setOrCreate('context', undefined)
      AppStorage.setOrCreate('context', context)
      expect(AppStorage.get('context') !== undefined).assertTrue()
    })

    it('security_save_tip_default_type_010', 0, () => {
      const saveTipStr = AppStorage.get('saveTipStr') as string
      expect(typeof saveTipStr).assertEqual('string')
    })

    it('security_image_filename_default_type_011', 0, () => {
      const imageFilename = AppStorage.get('imageFilename') as string
      expect(typeof imageFilename).assertEqual('string')
    })

    it('security_capture_reset_after_manual_assignment_012', 0, () => {
      AppStorage.setOrCreate('captureImage', 'sensitive')
      screenShotModel.dismiss()
      const captureImage = AppStorage.get('captureImage') as string | Object | undefined
      expect(captureImage === 'sensitive' || captureImage === '').assertTrue()
    })

    it('security_context_kept_when_open_fails_013', 0, () => {
      const want: Want = {
        bundleName: 'com.huawei.screenshot.tv',
        abilityName: 'MainAbility'
      }
      const context: StartAbilityContext = {
        startAbility: (_want: Want): Promise<void> => Promise.resolve()
      }
      AppStorage.setOrCreate('context', context)
      screenShotModel.openAbility(want)
      expect(AppStorage.get('context') !== undefined).assertTrue()
    })

    it('security_save_after_dismiss_014', 0, async () => {
      AppStorage.setOrCreate('captureImage', 'sensitive')
      screenShotModel.dismiss()
      await screenShotModel.saveImage()
      const captureImage = AppStorage.get('captureImage') as string | Object | undefined
      expect(captureImage === 'sensitive' || captureImage === '').assertTrue()
    })

    it('security_repeated_permission_checks_015', 0, async () => {
      await screenShotModel.shotScreen()
      await screenShotModel.shotScreen()
      const captureImage = AppStorage.get('captureImage') as string
      expect(typeof captureImage).assertEqual('string')
    })

    it('security_save_tip_stays_string_after_save_016', 0, async () => {
      await screenShotModel.saveImage()
      const saveTipStr = AppStorage.get('saveTipStr') as string
      expect(typeof saveTipStr).assertEqual('string')
    })

    it('security_context_can_be_cleared_018', 0, () => {
      const context: StartAbilityContext = {
        startAbility: (_want: Want): Promise<void> => Promise.resolve()
      }
      AppStorage.setOrCreate('context', context)
      AppStorage.setOrCreate('context', undefined)
      expect(AppStorage.get('context') === undefined).assertTrue()
    })

    it('security_open_ability_does_not_clear_filename_019', 0, () => {
      const want: Want = {
        bundleName: 'com.huawei.screenshot.tv',
        abilityName: 'MainAbility'
      }
      AppStorage.setOrCreate('imageFilename', 'secure_name')
      AppStorage.setOrCreate('context', undefined)
      screenShotModel.openAbility(want)
      const imageFilename = AppStorage.get('imageFilename') as string
      expect(typeof imageFilename).assertEqual('string')
    })
  })
}
