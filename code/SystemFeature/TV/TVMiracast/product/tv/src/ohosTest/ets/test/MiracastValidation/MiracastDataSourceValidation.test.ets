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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Log } from 'library';
import { getDeviceIdList, getDriver } from '../Shared/MiracastDriver';

const TAG: string = 'MiracastDataSourceSuite';

enum CastDeviceType {
  TV = 0, PHONE = 1, PAD = 2, PC = 3, UNKNOWN = 9
}

enum ChannelType {
  WIFI = 'wifi', SOFTBUS = 'softbus', P2P = 'p2p'
}

enum DeviceListChangeType {
  ADD = 'add', REMOVE = 'remove', UPDATE = 'update', CLEAR = 'clear'
}

interface DeviceListChange {
  type: DeviceListChangeType;
  deviceId: string;
  at: number;
}

class CastRemoteDeviceRow {
  public deviceId: string;
  public deviceName: string;
  public deviceType: number;
  public subDeviceType: number;
  public ipAddress: string;
  public channelType: ChannelType;
  public networkId: string;
  public isLeagacy: boolean;

  constructor(deviceId: string, deviceName: string, deviceType: number, subDeviceType: number,
    ipAddress: string, channelType: ChannelType, networkId: string, isLeagacy: boolean) {
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    this.deviceType = deviceType;
    this.subDeviceType = subDeviceType;
    this.ipAddress = ipAddress;
    this.channelType = channelType;
    this.networkId = networkId;
    this.isLeagacy = isLeagacy;
  }

  public clone(): CastRemoteDeviceRow {
    return new CastRemoteDeviceRow(this.deviceId, this.deviceName, this.deviceType,
      this.subDeviceType, this.ipAddress, this.channelType, this.networkId, this.isLeagacy);
  }

  public equals(other: CastRemoteDeviceRow): boolean {
    return this.deviceId === other.deviceId && this.deviceName === other.deviceName &&
      this.deviceType === other.deviceType && this.subDeviceType === other.subDeviceType &&
      this.ipAddress === other.ipAddress && this.channelType === other.channelType &&
      this.networkId === other.networkId && this.isLeagacy === other.isLeagacy;
  }

  public isSameIdentity(other: CastRemoteDeviceRow): boolean {
    return this.deviceId === other.deviceId;
  }

  public toDisplayName(): string {
    return this.deviceName.length === 0 ? this.deviceId : this.deviceName;
  }

  public toSummary(): string {
    return this.deviceName + '/' + this.deviceType + '/' + this.channelType + '/' + this.ipAddress;
  }

  public applyUpdate(other: CastRemoteDeviceRow): boolean {
    if (!this.isSameIdentity(other)) {
      return false;
    }
    this.deviceName = other.deviceName;
    this.deviceType = other.deviceType;
    this.subDeviceType = other.subDeviceType;
    this.ipAddress = other.ipAddress;
    this.channelType = other.channelType;
    this.networkId = other.networkId;
    this.isLeagacy = other.isLeagacy;
    return true;
  }
}
class IpAddressUtil {
  public static isIpv4(address: string): boolean {
    const parts = address.split('.');
    if (parts.length !== 4) {
      return false;
    }
    return parts.every((part: string): boolean => {
      if (part.length === 0 || part.length > 3 || (part.length > 1 && part.charAt(0) === '0')) {
        return false;
      }
      const value = parseInt(part, 10);
      return !isNaN(value) && value >= 0 && value <= 255;
    });
  }

  public static isPrivateRange(address: string): boolean {
    if (!IpAddressUtil.isIpv4(address)) {
      return false;
    }
    const first = parseInt(address.split('.')[0], 10);
    const second = parseInt(address.split('.')[1], 10);
    if (first === 10 || (first === 192 && second === 168)) {
      return true;
    }
    return first === 172 && second >= 16 && second <= 31;
  }
  public static getPrefix(address: string): string {
    if (!IpAddressUtil.isIpv4(address)) {
      return '';
    }
    const parts = address.split('.');
    return parts[0] + '.' + parts[1] + '.' + parts[2];
  }
}
class CastDeviceValidator {
  public static readonly MAX_NAME_LENGTH: number = 64;

  public isDeviceIdValid(deviceId: string): boolean {
    return /^[A-Za-z0-9:_-]{4,64}$/.test(deviceId);
  }

  public isDeviceNameValid(deviceName: string): boolean {
    return deviceName.length > 0 && deviceName.length <= CastDeviceValidator.MAX_NAME_LENGTH &&
      deviceName.trim().length === deviceName.length;
  }

  public isDeviceTypeValid(deviceType: number): boolean {
    return [CastDeviceType.TV, CastDeviceType.PHONE, CastDeviceType.PAD,
      CastDeviceType.PC, CastDeviceType.UNKNOWN].indexOf(deviceType) >= 0;
  }

  public isSubDeviceTypeValid(subDeviceType: number): boolean {
    return subDeviceType >= 0 && subDeviceType <= 15;
  }

  public isChannelValid(channelType: ChannelType): boolean {
    return [ChannelType.WIFI, ChannelType.SOFTBUS, ChannelType.P2P].indexOf(channelType) >= 0;
  }

  public isLegacyConsistent(row: CastRemoteDeviceRow): boolean {
    return !row.isLeagacy || row.channelType === ChannelType.WIFI;
  }

  public countInvalidFields(row: CastRemoteDeviceRow): number {
    const checks: boolean[] = [this.isDeviceIdValid(row.deviceId), this.isDeviceNameValid(row.deviceName),
      this.isDeviceTypeValid(row.deviceType), this.isSubDeviceTypeValid(row.subDeviceType),
      IpAddressUtil.isIpv4(row.ipAddress), this.isChannelValid(row.channelType)];
    return checks.filter((ok: boolean): boolean => !ok).length;
  }

  public isValid(row: CastRemoteDeviceRow): boolean {
    return this.countInvalidFields(row) === 0 && this.isLegacyConsistent(row);
  }

  public isValidNetworkId(networkId: string): boolean {
    return networkId.length <= 32;
  }
}
class CastDeviceListDataSource {
  private rows: CastRemoteDeviceRow[] = [];
  private changes: DeviceListChange[] = [];

  public add(row: CastRemoteDeviceRow): boolean {
    if (this.rows.some((item: CastRemoteDeviceRow): boolean => item.isSameIdentity(row))) {
      return false;
    }
    this.rows.push(row);
    this.recordChange(DeviceListChangeType.ADD, row.deviceId);
    return true;
  }

  public addOrReplace(row: CastRemoteDeviceRow): boolean {
    const index = this.rows.findIndex((item: CastRemoteDeviceRow): boolean => item.isSameIdentity(row));
    if (index < 0) {
      return this.add(row);
    }
    this.rows[index].applyUpdate(row);
    this.recordChange(DeviceListChangeType.UPDATE, row.deviceId);
    return true;
  }

  public remove(deviceId: string): boolean {
    const index = this.rows.findIndex((item: CastRemoteDeviceRow): boolean => item.deviceId === deviceId);
    if (index < 0) {
      return false;
    }
    this.rows.splice(index, 1);
    this.recordChange(DeviceListChangeType.REMOVE, deviceId);
    return true;
  }

  public clear(): void {
    this.rows = [];
    this.recordChange(DeviceListChangeType.CLEAR, '');
  }

  public size(): number { return this.rows.length; }

  public getAll(): CastRemoteDeviceRow[] { return [...this.rows]; }

  public findById(deviceId: string): CastRemoteDeviceRow | null {
    const found = this.rows.filter((item: CastRemoteDeviceRow): boolean => item.deviceId === deviceId);
    return found.length === 0 ? null : found[0];
  }

  public countByChannel(channelType: ChannelType): number {
    return this.rows.filter((item: CastRemoteDeviceRow): boolean => item.channelType === channelType).length;
  }

  public countLegacy(): number {
    return this.rows.filter((item: CastRemoteDeviceRow): boolean => item.isLeagacy).length;
  }

  public getDeviceIds(): string[] {
    return this.rows.map((item: CastRemoteDeviceRow): string => item.deviceId);
  }

  public getChangeCount(): number { return this.changes.length; }

  public getLastChange(): DeviceListChange | null {
    return this.changes.length === 0 ? null : this.changes[this.changes.length - 1];
  }
  private recordChange(type: DeviceListChangeType, deviceId: string): void {
    this.changes.push({ type: type, deviceId: deviceId, at: this.changes.length });
  }
}
class CastDeviceDedupAnalyzer {
  public countDuplicates(rows: CastRemoteDeviceRow[]): number {
    const ids = rows.map((item: CastRemoteDeviceRow): string => item.deviceId);
    return ids.length - new Set<string>(ids).size;
  }

  public hasDuplicate(rows: CastRemoteDeviceRow[]): boolean {
    return this.countDuplicates(rows) > 0;
  }

  public dedup(rows: CastRemoteDeviceRow[]): CastRemoteDeviceRow[] {
    const seen: Set<string> = new Set<string>();
    return rows.filter((item: CastRemoteDeviceRow): boolean => {
      if (seen.has(item.deviceId)) {
        return false;
      }
      seen.add(item.deviceId);
      return true;
    });
  }

  public getDuplicateIds(rows: CastRemoteDeviceRow[]): string[] {
    const seen: Set<string> = new Set<string>();
    const reported: Set<string> = new Set<string>();
    return rows.map((item: CastRemoteDeviceRow): string => item.deviceId)
      .filter((id: string): boolean => {
        const isDuplicate = seen.has(id) && !reported.has(id);
        if (isDuplicate) {
          reported.add(id);
        }
        seen.add(id);
        return isDuplicate;
      });
  }
}

class CastDeviceStatistics {
  public countByType(rows: CastRemoteDeviceRow[], deviceType: number): number {
    return rows.filter((item: CastRemoteDeviceRow): boolean => item.deviceType === deviceType).length;
  }

  public getLegacyRatio(rows: CastRemoteDeviceRow[]): number {
    if (rows.length === 0) {
      return 0;
    }
    return rows.filter((item: CastRemoteDeviceRow): boolean => item.isLeagacy).length / rows.length;
  }

  public getAverageNameLength(rows: CastRemoteDeviceRow[]): number {
    if (rows.length === 0) {
      return 0;
    }
    let sum: number = 0;
    rows.forEach((item: CastRemoteDeviceRow): void => {
      sum += item.deviceName.length;
    });
    return sum / rows.length;
  }

  public countInvalid(rows: CastRemoteDeviceRow[]): number {
    const validator = new CastDeviceValidator();
    return rows.filter((item: CastRemoteDeviceRow): boolean => !validator.isValid(item)).length;
  }
}

class CastDeviceSorter {
  public sortByName(rows: CastRemoteDeviceRow[]): CastRemoteDeviceRow[] {
    return [...rows].sort((left: CastRemoteDeviceRow, right: CastRemoteDeviceRow): number => {
      return left.deviceName === right.deviceName ? 0 : (left.deviceName < right.deviceName ? -1 : 1);
    });
  }

  public sortByType(rows: CastRemoteDeviceRow[]): CastRemoteDeviceRow[] {
    return [...rows].sort((left: CastRemoteDeviceRow, right: CastRemoteDeviceRow): number => left.deviceType - right.deviceType);
  }
}
export default function miracastDataSourceValidationSuite(): void {
  describe('MiracastDataSourceValidation_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'data source suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'data source suite finished');
    });

    it('device_id_valid_alphanumeric_should_pass', 0, async () => {
      const validator = new CastDeviceValidator();
      expect(validator.isDeviceIdValid('device-0001')).assertTrue();
      expect(validator.isDeviceIdValid('AA:BB:CC:DD')).assertTrue();
      expect(validator.isDeviceIdValid('dev_0001')).assertTrue();
      expect(validator.isDeviceIdValid('abc')).assertFalse();
      expect(validator.isDeviceIdValid('device 0001')).assertFalse();
      expect(validator.isDeviceIdValid('a'.repeat(64))).assertTrue();
      expect(validator.isDeviceIdValid('a'.repeat(65))).assertFalse();
    });

    it('device_name_validity_should_enforce_bounds', 0, async () => {
      const validator = new CastDeviceValidator();
      expect(validator.isDeviceNameValid('LivingRoomTV')).assertTrue();
      expect(validator.isDeviceNameValid('Living Room TV')).assertTrue();
      expect(validator.isDeviceNameValid('')).assertFalse();
      expect(validator.isDeviceNameValid('a'.repeat(64))).assertTrue();
      expect(validator.isDeviceNameValid('a'.repeat(65))).assertFalse();
      expect(validator.isDeviceNameValid(' LivingRoomTV')).assertFalse();
      expect(validator.isDeviceNameValid('LivingRoomTV ')).assertFalse();
    });
    it('device_type_and_sub_type_should_be_bounded', 0, async () => {
      const validator = new CastDeviceValidator();
      expect(validator.isDeviceTypeValid(CastDeviceType.TV)).assertTrue();
      expect(validator.isDeviceTypeValid(CastDeviceType.PHONE)).assertTrue();
      expect(validator.isDeviceTypeValid(CastDeviceType.PAD)).assertTrue();
      expect(validator.isDeviceTypeValid(CastDeviceType.PC)).assertTrue();
      expect(validator.isDeviceTypeValid(CastDeviceType.UNKNOWN)).assertTrue();
      expect(validator.isDeviceTypeValid(4)).assertFalse();
      expect(validator.isDeviceTypeValid(-1)).assertFalse();
      expect(validator.isSubDeviceTypeValid(0)).assertTrue();
      expect(validator.isSubDeviceTypeValid(15)).assertTrue();
      expect(validator.isSubDeviceTypeValid(16)).assertFalse();
      expect(validator.isSubDeviceTypeValid(-1)).assertFalse();
    });

    it('ipv4_address_and_leading_zero_should_be_validated', 0, async () => {
      expect(IpAddressUtil.isIpv4('192.168.1.10')).assertTrue();
      expect(IpAddressUtil.isIpv4('10.0.0.1')).assertTrue();
      expect(IpAddressUtil.isIpv4('255.255.255.255')).assertTrue();
      expect(IpAddressUtil.isIpv4('0.0.0.0')).assertTrue();
      expect(IpAddressUtil.isIpv4('192.168.01.1')).assertFalse();
      expect(IpAddressUtil.isIpv4('01.2.3.4')).assertFalse();
    });

    it('ipv4_invalid_octet_segment_or_prefix_should_fail', 0, async () => {
      expect(IpAddressUtil.isIpv4('256.1.1.1')).assertFalse();
      expect(IpAddressUtil.isIpv4('192.168.1.256')).assertFalse();
      expect(IpAddressUtil.isIpv4('192.168.1.-1')).assertFalse();
      expect(IpAddressUtil.isIpv4('192.168.1')).assertFalse();
      expect(IpAddressUtil.isIpv4('192.168.1.1.1')).assertFalse();
      expect(IpAddressUtil.isIpv4('')).assertFalse();
      expect(IpAddressUtil.getPrefix('192.168.4.77')).assertEqual('192.168.4');
      expect(IpAddressUtil.getPrefix('bad')).assertEqual('');
    });
    it('ipv4_private_and_public_range_should_be_distinguished', 0, async () => {
      expect(IpAddressUtil.isPrivateRange('10.1.2.3')).assertTrue();
      expect(IpAddressUtil.isPrivateRange('192.168.0.9')).assertTrue();
      expect(IpAddressUtil.isPrivateRange('172.16.0.1')).assertTrue();
      expect(IpAddressUtil.isPrivateRange('172.31.255.255')).assertTrue();
      expect(IpAddressUtil.isPrivateRange('172.32.0.1')).assertFalse();
      expect(IpAddressUtil.isPrivateRange('8.8.8.8')).assertFalse();
      expect(IpAddressUtil.isPrivateRange('not-an-ip')).assertFalse();
    });

    it('channel_type_members_should_pass', 0, async () => {
      const validator = new CastDeviceValidator();
      expect(validator.isChannelValid(ChannelType.WIFI)).assertTrue();
      expect(validator.isChannelValid(ChannelType.SOFTBUS)).assertTrue();
      expect(validator.isChannelValid(ChannelType.P2P)).assertTrue();
    });

    it('legacy_device_must_use_wifi_channel', 0, async () => {
      const validator = new CastDeviceValidator();
      const legacyWifi = new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.2', ChannelType.WIFI, 'n1', true);
      const legacySoftbus = new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.3', ChannelType.SOFTBUS, 'n1', true);
      const modernSoftbus = new CastRemoteDeviceRow('dev-0003', 'TV3', 1, 0, '192.168.1.4', ChannelType.SOFTBUS, 'n2', false);
      expect(validator.isLegacyConsistent(legacyWifi)).assertTrue();
      expect(validator.isLegacyConsistent(legacySoftbus)).assertFalse();
      expect(validator.isLegacyConsistent(modernSoftbus)).assertTrue();
    });

    it('network_id_length_should_be_bounded', 0, async () => {
      const validator = new CastDeviceValidator();
      expect(validator.isValidNetworkId('')).assertTrue();
      expect(validator.isValidNetworkId('n'.repeat(32))).assertTrue();
      expect(validator.isValidNetworkId('n'.repeat(33))).assertFalse();
    });
    it('fully_valid_row_should_report_zero_invalid_fields', 0, async () => {
      const validator = new CastDeviceValidator();
      const valid = new CastRemoteDeviceRow('dev-0001', 'LivingRoomTV', 1, 2, '192.168.1.10', ChannelType.WIFI, 'n1', false);
      expect(validator.countInvalidFields(valid)).assertEqual(0);
      expect(validator.isValid(valid)).assertTrue();
      const conflict = new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.P2P, 'n1', true);
      expect(validator.countInvalidFields(conflict)).assertEqual(0);
      expect(validator.isValid(conflict)).assertFalse();
    });

    it('invalid_row_should_count_each_bad_field', 0, async () => {
      const validator = new CastDeviceValidator();
      const row = new CastRemoteDeviceRow('', ' TV ', 99, 20, '1.2.3.999', ChannelType.WIFI, 'n1', false);
      expect(validator.countInvalidFields(row)).assertEqual(5);
      expect(validator.isValid(row)).assertFalse();
    });

    it('data_source_should_add_device_and_emit_change', 0, async () => {
      const source = new CastDeviceListDataSource();
      expect(source.add(new CastRemoteDeviceRow('dev-b', 'B', 1, 0, '192.168.1.2', ChannelType.WIFI, 'n1', false))).assertTrue();
      expect(source.add(new CastRemoteDeviceRow('dev-a', 'A', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false))).assertTrue();
      expect(source.size()).assertEqual(2);
      expect(source.getDeviceIds()[0]).assertEqual('dev-b');
      expect(source.getDeviceIds()[1]).assertEqual('dev-a');
      const change = source.getLastChange();
      expect(change?.type).assertEqual(DeviceListChangeType.ADD);
    });
    it('data_source_should_reject_duplicate_device_id', 0, async () => {
      const source = new CastDeviceListDataSource();
      source.add(new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.WIFI, 'n1', false));
      expect(source.add(new CastRemoteDeviceRow('dev-0001', 'TV1-copy', 1, 0, '192.168.1.11', ChannelType.WIFI, 'n1', false))).assertFalse();
      expect(source.size()).assertEqual(1);
      expect(source.getChangeCount()).assertEqual(1);
    });

    it('data_source_add_or_replace_should_update_existing', 0, async () => {
      const source = new CastDeviceListDataSource();
      source.add(new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.WIFI, 'n1', false));
      expect(source.addOrReplace(new CastRemoteDeviceRow('dev-0001', 'TV1-renamed', 2, 3, '192.168.1.20', ChannelType.SOFTBUS, 'n2', false))).assertTrue();
      expect(source.size()).assertEqual(1);
      const row = source.findById('dev-0001');
      expect(row?.deviceName).assertEqual('TV1-renamed');
      expect(row?.channelType).assertEqual(ChannelType.SOFTBUS);
      expect(source.addOrReplace(new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.12', ChannelType.P2P, 'n1', false))).assertTrue();
      expect(source.size()).assertEqual(2);
    });
    it('data_source_remove_existing_device_should_succeed', 0, async () => {
      const source = new CastDeviceListDataSource();
      source.add(new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.WIFI, 'n1', false));
      expect(source.remove('dev-0001')).assertTrue();
      expect(source.size()).assertEqual(0);
      expect(source.findById('dev-0001')).assertNull();
      expect(source.remove('ghost')).assertFalse();
      const change = source.getLastChange();
      expect(change?.type).assertEqual(DeviceListChangeType.REMOVE);
    });

    it('data_source_clear_should_emit_single_clear_event', 0, async () => {
      const source = new CastDeviceListDataSource();
      source.add(new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.WIFI, 'n1', false));
      source.add(new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.11', ChannelType.WIFI, 'n1', false));
      source.clear();
      expect(source.size()).assertEqual(0);
      expect(source.getDeviceIds().length).assertEqual(0);
      const change = source.getLastChange();
      expect(change?.type).assertEqual(DeviceListChangeType.CLEAR);
    });

    it('data_source_should_count_by_channel_and_legacy', 0, async () => {
      const source = new CastDeviceListDataSource();
      source.add(new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.10', ChannelType.WIFI, 'n1', true));
      source.add(new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.11', ChannelType.WIFI, 'n1', false));
      source.add(new CastRemoteDeviceRow('dev-0003', 'TV3', 1, 0, '192.168.1.12', ChannelType.SOFTBUS, 'n2', false));
      expect(source.countByChannel(ChannelType.WIFI)).assertEqual(2);
      expect(source.countByChannel(ChannelType.P2P)).assertEqual(0);
      expect(source.countLegacy()).assertEqual(1);
      const detached = source.getAll();
      detached.push(new CastRemoteDeviceRow('dev-9999', 'Ghost', 1, 0, '192.168.1.99', ChannelType.WIFI, 'n1', false));
      expect(source.size()).assertEqual(3);
      expect(detached.length).assertEqual(4);
    });

    it('dedup_analyzer_should_detect_duplicate_ids', 0, async () => {
      const analyzer = new CastDeviceDedupAnalyzer();
      const rows: CastRemoteDeviceRow[] = [
        new CastRemoteDeviceRow('dev-0001', 'A', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0001', 'B', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.2', ChannelType.WIFI, 'n1', false)
      ];
      expect(analyzer.countDuplicates(rows)).assertEqual(1);
      expect(analyzer.hasDuplicate(rows)).assertTrue();
      expect(analyzer.getDuplicateIds(rows)[0]).assertEqual('dev-0001');
    });

    it('dedup_analyzer_should_keep_first_occurrence', 0, async () => {
      const analyzer = new CastDeviceDedupAnalyzer();
      const rows: CastRemoteDeviceRow[] = [
        new CastRemoteDeviceRow('dev-0001', 'First', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0001', 'Second', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false)
      ];
      const result = analyzer.dedup(rows);
      expect(result.length).assertEqual(1);
      expect(result[0].deviceName).assertEqual('First');
      expect(analyzer.countDuplicates([])).assertEqual(0);
      expect(analyzer.dedup([]).length).assertEqual(0);
      expect(analyzer.getDuplicateIds([]).length).assertEqual(0);
    });
    it('row_identity_should_ignore_name_change', 0, async () => {
      const left = new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false);
      const right = new CastRemoteDeviceRow('dev-0001', 'TV1-new', 3, 4, '192.168.1.9', ChannelType.P2P, 'n9', true);
      const other = new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.2', ChannelType.WIFI, 'n1', false);
      expect(left.isSameIdentity(right)).assertTrue();
      expect(left.equals(right)).assertFalse();
      expect(left.applyUpdate(other)).assertFalse();
      expect(left.deviceName).assertEqual('TV1');
    });

    it('row_clone_should_be_equal_and_independent', 0, async () => {
      const row = new CastRemoteDeviceRow('dev-0001', 'TV1', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false);
      const copy = row.clone();
      expect(row.equals(copy)).assertTrue();
      copy.deviceName = 'changed';
      expect(row.equals(copy)).assertFalse();
      expect(row.deviceName).assertEqual('TV1');
    });

    it('row_display_name_and_summary_should_reflect_fields', 0, async () => {
      const anonymous = new CastRemoteDeviceRow('dev-0001', '', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false);
      const named = new CastRemoteDeviceRow('dev-0002', 'TV2', 1, 0, '192.168.1.2', ChannelType.SOFTBUS, 'n1', false);
      expect(anonymous.toDisplayName()).assertEqual('dev-0001');
      expect(named.toDisplayName()).assertEqual('TV2');
      expect(named.toSummary()).assertContain('TV2');
      expect(named.toSummary()).assertContain('softbus');
      expect(named.toSummary()).assertContain('192.168.1.2');
    });
    it('statistics_should_count_and_measure_rows', 0, async () => {
      const rows: CastRemoteDeviceRow[] = [
        new CastRemoteDeviceRow('dev-0001', 'AA', 1, 0, '192.168.1.1', ChannelType.WIFI, 'n1', true),
        new CastRemoteDeviceRow('dev-0002', 'BBBB', 1, 0, '192.168.1.2', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0003', 'CC', 3, 0, '192.168.1.3', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('', 'DDDD', 1, 0, '192.168.1.4', ChannelType.WIFI, 'n1', true)
      ];
      const stats = new CastDeviceStatistics();
      expect(stats.countByType(rows, 1)).assertEqual(3);
      expect(stats.countByType(rows, 3)).assertEqual(1);
      expect(stats.countByType(rows, 2)).assertEqual(0);
      expect(stats.getLegacyRatio(rows)).assertEqual(0.5);
      expect(stats.getAverageNameLength(rows)).assertEqual(3);
      expect(stats.countInvalid(rows)).assertEqual(1);
      expect(stats.getLegacyRatio([])).assertEqual(0);
      expect(stats.getAverageNameLength([])).assertEqual(0);
      expect(stats.countInvalid([])).assertEqual(0);
    });

    it('sorter_should_sort_without_mutating_input', 0, async () => {
      const rows: CastRemoteDeviceRow[] = [
        new CastRemoteDeviceRow('dev-0001', 'PC1', 3, 0, '192.168.1.1', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0002', 'TV1', 0, 0, '192.168.1.2', ChannelType.WIFI, 'n1', false),
        new CastRemoteDeviceRow('dev-0003', 'Phone1', 1, 0, '192.168.1.3', ChannelType.WIFI, 'n1', false)
      ];
      const sorter = new CastDeviceSorter();
      const byType = sorter.sortByType(rows);
      expect(byType[0].deviceType).assertEqual(0);
      expect(byType[1].deviceType).assertEqual(1);
      expect(byType[2].deviceType).assertEqual(3);
      const byName = sorter.sortByName(rows);
      expect(byName[0].deviceName).assertEqual('PC1');
      expect(byName[1].deviceName).assertEqual('Phone1');
      expect(byName[2].deviceName).assertEqual('TV1');
      expect(rows[0].deviceName).assertEqual('PC1');
      expect(sorter.sortByType([]).length).assertEqual(0);
      expect(sorter.sortByName([]).length).assertEqual(0);
    });

    it('driver_device_id_list_should_be_array', 0, async () => {
      let ids: string[] = [];
      try {
        ids = await getDeviceIdList(getDriver());
      } catch (e) {
        Log.error(TAG, 'get device id list failed');
      }
      expect(ids.length).assertLargerOrEqual(0);
      Log.info(TAG, 'driver device id list length measured');
    });
  });
}
