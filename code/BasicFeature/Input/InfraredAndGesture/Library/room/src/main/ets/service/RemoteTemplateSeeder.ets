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

import { AppLogger, StringResources } from 'common';
import { IrCode } from 'ircore';
import {
  Device,
  DeviceType,
  getDeviceTypeLabel,
  getKeySemanticLabel,
  KeySemantic,
  RemoteTemplate,
  RoomKey
} from '../model/RoomTypes';
import { DeviceDao } from '../data/DeviceDao';
import { IrCodeDao } from '../data/IrCodeDao';
import { KeyDao } from '../data/KeyDao';
import { RemoteTemplateDao } from '../data/RemoteTemplateDao';

const TEMPLATE_PREFIX: string = 'tpl-';
const KEY_ID_PREFIX: string = 'key-';
const SCOPE: string = 'RemoteTemplateSeeder';

/**
 * Seeds builtin remote templates per device type and applies template
 * layouts to devices by creating missing keys.
 */
export class RemoteTemplateSeeder {
  /** Upserts one builtin template per supported device type. */
  static async seedDefaults(): Promise<void> {
    const types: DeviceType[] = RemoteTemplateSeeder.allTypes();
    for (let i = 0; i < types.length; i++) {
      const template: RemoteTemplate = new RemoteTemplate();
      template.id = `${TEMPLATE_PREFIX}${types[i].toString()}`;
      template.deviceType = types[i];
      template.name = RemoteTemplateSeeder.templateName(types[i]);
      template.layout = RemoteTemplateSeeder.layoutOf(types[i]);
      template.builtin = true;
      await RemoteTemplateDao.upsert(template);
    }
    AppLogger.info(SCOPE, `seedDefaults done: templates=${types.length}`);
  }

  /** Returns the KeySemantic list defined by the template of a device type. */
  static getLayout(deviceType: DeviceType): KeySemantic[] {
    return RemoteTemplateSeeder.parseLayout(RemoteTemplateSeeder.layoutOf(deviceType));
  }

  /**
   * Creates missing keys for a device from the template layout; returns the
   * number created.
   */
  static async applyTemplate(deviceId: string, templateId: string): Promise<number> {
    AppLogger.info(SCOPE, 'applyTemplate enter: templateId=' + templateId);
    const template: RemoteTemplate | undefined =
      await RemoteTemplateDao.get(templateId);
    if (template === undefined) {
      AppLogger.warn(SCOPE, `applyTemplate rejected: template not found, templateId=${templateId}`);
      throw new Error('Remote template does not exist');
    }
    const device: Device | undefined = await DeviceDao.get(deviceId);
    if (device === undefined) {
      AppLogger.warn(SCOPE, 'applyTemplate rejected: device not found');
      throw new Error('Device does not exist');
    }

    const existing: RoomKey[] = await KeyDao.listByDevice(deviceId);
    const used: string[] = [];
    for (let i = 0; i < existing.length; i++) {
      used.push(existing[i].semantic);
    }
    const codes: IrCode[] = await IrCodeDao.listByBrand(device.brand);
    const semantics: KeySemantic[] = RemoteTemplateSeeder.parseLayout(template.layout);
    const baseOrder: number = existing.length;
    let created: number = 0;
    for (let i = 0; i < semantics.length; i++) {
      const semantic: KeySemantic = semantics[i];
      if (used.indexOf(semantic) >= 0) {
        continue;
      }
      const key: RoomKey = new RoomKey();
      key.id = `${KEY_ID_PREFIX}${deviceId}-${semantic.toString()}`;
      key.deviceId = deviceId;
      key.semantic = semantic;
      key.label = getKeySemanticLabel(semantic);
      key.irCodeId = RemoteTemplateSeeder.matchCode(codes, device, semantic);
      key.sortOrder = baseOrder + created;
      await KeyDao.insert(key);
      used.push(semantic);
      created++;
    }
    AppLogger.info(SCOPE, 'applyTemplate done: created=' + created.toString());
    return created;
  }

  /** Builds the localized template name with an English fallback. */
  private static templateName(type: DeviceType): string {
    const label: string = getDeviceTypeLabel(type);
    const formatted: string =
      StringResources.format($r('app.string.template_default_suffix'), label);
    return formatted.length > 0 ? formatted : `${label} Default Template`;
  }

  /** Lists every device type in template seeding order. */
  private static allTypes(): DeviceType[] {
    return [
      DeviceType.PROJECTOR,
      DeviceType.SCREEN,
      DeviceType.LIGHT,
      DeviceType.AC,
      DeviceType.TV,
      DeviceType.AUDIO
    ];
  }

  /** Returns the comma-separated key layout of a device type. */
  private static layoutOf(type: DeviceType): string {
    switch (type) {
      case DeviceType.PROJECTOR:
        return 'POWER_ON,POWER_OFF,HDMI_1,HDMI_2,VOL_UP,VOL_DOWN';
      case DeviceType.SCREEN:
        return 'POWER_ON,POWER_OFF,SCREEN_UP,SCREEN_DOWN';
      case DeviceType.LIGHT:
        return 'POWER_ON,POWER_OFF';
      case DeviceType.AC:
        return 'POWER_ON,POWER_OFF,TEMP_UP,TEMP_DOWN,FAN_SPEED';
      case DeviceType.TV:
        return 'POWER_ON,POWER_OFF,HDMI_1,HDMI_2,VOL_UP,VOL_DOWN';
      case DeviceType.AUDIO:
        return 'POWER_ON,POWER_OFF,VOL_UP,VOL_DOWN';
      default:
        return '';
    }
  }

  /** Parses a comma-separated layout into KeySemantic values. */
  private static parseLayout(layout: string): KeySemantic[] {
    const semantics: KeySemantic[] = [];
    if (layout.length === 0) {
      return semantics;
    }
    const parts: string[] = layout.split(',');
    for (let i = 0; i < parts.length; i++) {
      const text: string = parts[i].trim();
      if (text.length > 0) {
        semantics.push(text as KeySemantic);
      }
    }
    return semantics;
  }

  /** Finds the first code matching brand, model and semantic; empty when none. */
  private static matchCode(codes: IrCode[], device: Device,
    semantic: KeySemantic): string {
    for (let i = 0; i < codes.length; i++) {
      const code: IrCode = codes[i];
      if (code.brand === device.brand && code.model === device.model &&
        code.keySemantic === semantic) {
        return code.id;
      }
    }
    return '';
  }
}
