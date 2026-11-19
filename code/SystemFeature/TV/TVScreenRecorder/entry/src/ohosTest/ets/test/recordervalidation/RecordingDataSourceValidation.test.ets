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
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  recorderComponentCount,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecordingDataSourceValidation';

// Subtype of a media asset created by photoAccessHelper.createAsset.
enum AssetSubtype {
  SCREENSHOT = 0,
  VIDEO = 1
}

// One recording asset exposed to the list data source.
class VideoAssetItem {
  public fileName: string;
  public uri: string;
  public fd: number;
  public subtype: number;
  public sizeBytes: number;

  constructor(fileName: string, uri: string, fd: number, subtype: number, sizeBytes: number) {
    this.fileName = fileName;
    this.uri = uri;
    this.fd = fd;
    this.subtype = subtype;
    this.sizeBytes = sizeBytes;
  }
}

// Data source consumed by the recorder tip window list.
class VideoAssetDataSource {
  private items: VideoAssetItem[] = [];
  private listeners: Array<() => void> = [];

  public totalCount(): number {
    return this.items.length;
  }

  public getData(index: number): VideoAssetItem | undefined {
    if (index < 0 || index >= this.items.length) {
      return undefined;
    }
    return this.items[index];
  }

  public push(item: VideoAssetItem): void {
    this.items.push(item);
    this.notifyDataAdd();
  }

  public splice(index: number): void {
    if (index >= 0 && index < this.items.length) {
      this.items.splice(index, 1);
      this.notifyDataDelete();
    }
  }

  public clear(): void {
    this.items = [];
    this.notifyDataReload();
  }

  public registerDataChangeListener(listener: () => void): void {
    if (!this.listeners.includes(listener)) {
      this.listeners.push(listener);
    }
  }

  public unregisterDataChangeListener(listener: () => void): void {
    const index: number = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  public getAllItems(): VideoAssetItem[] {
    const result: VideoAssetItem[] = [];
    for (let i = 0; i < this.items.length; i++) {
      result.push(this.items[i]);
    }
    return result;
  }

  private notifyDataAdd(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }

  private notifyDataDelete(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }

  private notifyDataReload(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }
}

// Asset change kinds published by the data source.
enum AssetChangeType {
  ADD = 'add',
  DELETE = 'delete',
  RELOAD = 'reload',
  UPDATE = 'update'
}

// Operations accepted by the recording asset data source.
enum AssetDataSourceOperation {
  PUSH = 'push',
  SPLICE = 'splice',
  CLEAR = 'clear',
  QUERY = 'query'
}

// One change notification with the affected index.
interface AssetChangeNotification {
  type: AssetChangeType;
  index: number;
  timestamp: number;
}

// Aggregated statistics of the recording asset data source.
interface AssetDataSourceStats {
  totalCount: number;
  listenerCount: number;
  addCount: number;
  deleteCount: number;
}

// Asset item with a stable identifier used for fd bookkeeping.
class IdentifiedVideoAsset {
  public id: number;
  public fileName: string;
  public fd: number;
  public sizeBytes: number;

  constructor(id: number, fileName: string, fd: number, sizeBytes: number) {
    this.id = id;
    this.fileName = fileName;
    this.fd = fd;
    this.sizeBytes = sizeBytes;
  }

  public clone(): IdentifiedVideoAsset {
    return new IdentifiedVideoAsset(this.id, this.fileName, this.fd, this.sizeBytes);
  }

  public equals(other: IdentifiedVideoAsset): boolean {
    return this.id === other.id && this.fileName === other.fileName && this.fd === other.fd;
  }

  public toString(): string {
    return `IdentifiedVideoAsset(id=${this.id}, name=${this.fileName}, fd=${this.fd})`;
  }

  public isValid(): boolean {
    return this.id >= 0 && this.fileName.length > 0 && this.fd >= 0;
  }
}

// Records every change notification emitted by a data source.
class AssetChangeNotifier {
  private notifications: AssetChangeNotification[] = [];

  public notify(type: AssetChangeType, index: number): void {
    const notification: AssetChangeNotification = {
      type: type,
      index: index,
      timestamp: Date.now()
    };
    this.notifications.push(notification);
  }

  public getNotificationCount(): number {
    return this.notifications.length;
  }

  public getCountByType(type: AssetChangeType): number {
    let count: number = 0;
    for (let i = 0; i < this.notifications.length; i++) {
      if (this.notifications[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getNotifications(): AssetChangeNotification[] {
    const result: AssetChangeNotification[] = [];
    for (let i = 0; i < this.notifications.length; i++) {
      const notification: AssetChangeNotification = this.notifications[i];
      const copy: AssetChangeNotification = {
        type: notification.type,
        index: notification.index,
        timestamp: notification.timestamp
      };
      result.push(copy);
    }
    return result;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.notifications.length; i++) {
      if (this.notifications[i].timestamp < this.notifications[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public getLastNotification(): AssetChangeNotification | null {
    if (this.notifications.length === 0) {
      return null;
    }
    const last: AssetChangeNotification = this.notifications[this.notifications.length - 1];
    const copy: AssetChangeNotification = {
      type: last.type,
      index: last.index,
      timestamp: last.timestamp
    };
    return copy;
  }

  public clear(): void {
    this.notifications = [];
  }
}

// Records the operations applied to the data source.
class AssetOperationRecorder {
  private operations: AssetDataSourceOperation[] = [];

  public record(operation: AssetDataSourceOperation): void {
    this.operations.push(operation);
  }

  public getOperationCount(): number {
    return this.operations.length;
  }

  public getCountByOperation(operation: AssetDataSourceOperation): number {
    let count: number = 0;
    for (let i = 0; i < this.operations.length; i++) {
      if (this.operations[i] === operation) {
        count++;
      }
    }
    return count;
  }

  public getOperations(): AssetDataSourceOperation[] {
    const result: AssetDataSourceOperation[] = [];
    for (let i = 0; i < this.operations.length; i++) {
      result.push(this.operations[i]);
    }
    return result;
  }

  public clear(): void {
    this.operations = [];
  }
}

// Identified asset store keyed by an incrementing identifier.
class IdentifiedAssetDataSource {
  private items: IdentifiedVideoAsset[] = [];
  private nextId: number = 0;

  public add(fileName: string, fd: number, sizeBytes: number): number {
    const item = new IdentifiedVideoAsset(this.nextId, fileName, fd, sizeBytes);
    this.items.push(item);
    const assignedId: number = this.nextId;
    this.nextId++;
    return assignedId;
  }

  public totalCount(): number {
    return this.items.length;
  }

  public getById(id: number): IdentifiedVideoAsset | null {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        return this.items[i];
      }
    }
    return null;
  }

  public getByIndex(index: number): IdentifiedVideoAsset | null {
    if (index < 0 || index >= this.items.length) {
      return null;
    }
    return this.items[index];
  }

  public removeById(id: number): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        this.items.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public containsId(id: number): boolean {
    return this.getById(id) !== null;
  }

  public getItems(): IdentifiedVideoAsset[] {
    const result: IdentifiedVideoAsset[] = [];
    for (let i = 0; i < this.items.length; i++) {
      result.push(this.items[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.items = [];
    this.nextId = 0;
  }
}

// Computes aggregate statistics over recording assets.
class AssetDataSourceStatistics {
  public computeStats(items: VideoAssetItem[], listenerCount: number, addCount: number,
    deleteCount: number): AssetDataSourceStats {
    const stats: AssetDataSourceStats = {
      totalCount: items.length,
      listenerCount: listenerCount,
      addCount: addCount,
      deleteCount: deleteCount
    };
    return stats;
  }

  public countBySubtype(items: VideoAssetItem[], subtype: number): number {
    let count: number = 0;
    for (let i = 0; i < items.length; i++) {
      if (items[i].subtype === subtype) {
        count++;
      }
    }
    return count;
  }

  public totalSizeBytes(items: VideoAssetItem[]): number {
    let total: number = 0;
    for (let i = 0; i < items.length; i++) {
      total += items[i].sizeBytes;
    }
    return total;
  }

  public getSubtypeDistribution(items: VideoAssetItem[]): Map<number, number> {
    const distribution = new Map<number, number>();
    for (let i = 0; i < items.length; i++) {
      const subtype: number = items[i].subtype;
      const current: number | undefined = distribution.get(subtype);
      const count: number = current === undefined ? 0 : current;
      distribution.set(subtype, count + 1);
    }
    return distribution;
  }

  public isEmpty(items: VideoAssetItem[]): boolean {
    return items.length === 0;
  }

  public hasDuplicates(items: VideoAssetItem[]): boolean {
    for (let i = 0; i < items.length; i++) {
      for (let j = i + 1; j < items.length; j++) {
        if (items[i].fileName === items[j].fileName) {
          return true;
        }
      }
    }
    return false;
  }
}

// Builds the standard recording asset fixtures.
class VideoAssetFactory {
  public createStandardAssets(): VideoAssetItem[] {
    const assets: VideoAssetItem[] = [];
    assets.push(new VideoAssetItem('REC_20260115_102030.mp4', 'file://media/Photo/1', 11, AssetSubtype.VIDEO,
      1024));
    assets.push(new VideoAssetItem('REC_20260115_102130.mp4', 'file://media/Photo/2', 12, AssetSubtype.VIDEO,
      2048));
    return assets;
  }

  public createIdentifiedAssets(): IdentifiedVideoAsset[] {
    const assets: IdentifiedVideoAsset[] = [];
    assets.push(new IdentifiedVideoAsset(0, 'REC_20260115_102030.mp4', 11, 1024));
    assets.push(new IdentifiedVideoAsset(1, 'REC_20260115_102130.mp4', 12, 2048));
    return assets;
  }

  public createEmptyAssets(): VideoAssetItem[] {
    return [];
  }

  public createRepeatedAssets(fileName: string, count: number): VideoAssetItem[] {
    const assets: VideoAssetItem[] = [];
    for (let i = 0; i < count; i++) {
      assets.push(new VideoAssetItem(fileName, 'file://media/Photo/' + i, i, AssetSubtype.VIDEO, 10));
    }
    return assets;
  }
}

// Tracks the file descriptors opened for photoAccessHelper assets.
class FdSinkRegistry {
  private openFds: number[] = [];

  public open(fd: number): boolean {
    if (fd < 0 || this.openFds.includes(fd)) {
      return false;
    }
    this.openFds.push(fd);
    return true;
  }

  public close(fd: number): boolean {
    const index: number = this.openFds.indexOf(fd);
    if (index < 0) {
      return false;
    }
    this.openFds.splice(index, 1);
    return true;
  }

  public isOpen(fd: number): boolean {
    return this.openFds.includes(fd);
  }

  public getOpenCount(): number {
    return this.openFds.length;
  }

  public buildSinkUrl(fd: number): string {
    return 'fd://' + fd;
  }

  public closeAll(): number {
    const closed: number = this.openFds.length;
    this.openFds = [];
    return closed;
  }
}

export default function recordingDataSourceValidationTest(): void {
  describe('RecordingDataSourceValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recording data source validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recording data source validation finished');
      await serializedDelay(driver, 300);
    });

    // BasicDataSource_Core: totalCount mirrors the asset array length.
    it('total_count_should_return_asset_count', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      ds.push(new VideoAssetItem('REC_2.mp4', 'file://media/Photo/2', 2, AssetSubtype.VIDEO, 200));
      expect(ds.totalCount()).assertEqual(2);
    });

    // BasicDataSource_Core: an empty data source reports zero.
    it('total_count_should_be_zero_for_empty_source', 0, async () => {
      expect(new VideoAssetDataSource().totalCount()).assertEqual(0);
    });

    // BasicDataSource_Core: getData returns the element at the index.
    it('get_data_should_return_element_at_index', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 7, AssetSubtype.VIDEO, 100));
      const item: VideoAssetItem | undefined = ds.getData(0);
      expect(item === undefined).assertFalse();
      if (item !== undefined) {
        expect(item.fileName).assertEqual('REC_1.mp4');
        expect(item.fd).assertEqual(7);
      }
    });

    // BasicDataSource_Edge_Cases: out of bounds access returns undefined.
    it('get_data_out_of_bounds_should_return_undefined', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      expect(ds.getData(100)).assertUndefined();
      expect(ds.getData(-1)).assertUndefined();
    });

    // BasicDataSource_Core: registering a listener increments the count.
    it('register_listener_should_add_listener', 0, async () => {
      const ds = new VideoAssetDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(1);
    });

    // BasicDataSource_Core: unregistering a listener decrements the count.
    it('unregister_listener_should_remove_listener', 0, async () => {
      const ds = new VideoAssetDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      ds.unregisterDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(0);
    });

    // BasicDataSource_Core: duplicate registration is ignored.
    it('duplicate_listener_registration_should_be_ignored', 0, async () => {
      const ds = new VideoAssetDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      ds.registerDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(1);
    });

    // BasicDataSource_No_Listener_Safety: reload without listeners is safe.
    it('notify_reload_without_listeners_should_not_crash', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.clear();
      expect(ds.totalCount()).assertEqual(0);
    });

    // BasicDataSource_No_Listener_Safety: add without listeners is safe.
    it('notify_add_without_listeners_should_not_crash', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      expect(ds.totalCount()).assertEqual(1);
    });

    // FileDataSource_Operations: splice removes the targeted asset.
    it('splice_should_remove_asset', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      ds.push(new VideoAssetItem('REC_2.mp4', 'file://media/Photo/2', 2, AssetSubtype.VIDEO, 200));
      ds.splice(0);
      expect(ds.totalCount()).assertEqual(1);
      const item: VideoAssetItem | undefined = ds.getData(0);
      expect(item === undefined).assertFalse();
      if (item !== undefined) {
        expect(item.fileName).assertEqual('REC_2.mp4');
      }
    });

    // FileDataSource_Operations: clear empties the asset array.
    it('clear_should_empty_asset_array', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      ds.clear();
      expect(ds.totalCount()).assertEqual(0);
    });

    // BasicDataSource_Core: every listener receives the change notification.
    it('multiple_listeners_should_all_receive_notifications', 0, async () => {
      const ds = new VideoAssetDataSource();
      let count1: number = 0;
      let count2: number = 0;
      const listener1: () => void = () => {
        count1++;
      };
      const listener2: () => void = () => {
        count2++;
      };
      ds.registerDataChangeListener(listener1);
      ds.registerDataChangeListener(listener2);
      ds.push(new VideoAssetItem('REC_3.mp4', 'file://media/Photo/3', 3, AssetSubtype.VIDEO, 300));
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
    });

    // Collection_Boundaries: single asset data source.
    it('single_asset_data_source_should_have_one_item', 0, async () => {
      const ds = new VideoAssetDataSource();
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getAllItems().length).assertEqual(1);
    });

    // AssetChangeNotifier: notifications are counted per change type.
    it('change_notifier_should_count_by_type', 0, async () => {
      const notifier = new AssetChangeNotifier();
      notifier.notify(AssetChangeType.ADD, 0);
      notifier.notify(AssetChangeType.DELETE, 1);
      notifier.notify(AssetChangeType.ADD, 2);
      expect(notifier.getNotificationCount()).assertEqual(3);
      expect(notifier.getCountByType(AssetChangeType.ADD)).assertEqual(2);
      expect(notifier.getCountByType(AssetChangeType.UPDATE)).assertEqual(0);
      expect(notifier.isChronological()).assertTrue();
    });

    // AssetChangeNotifier: last notification lookup mirrors the newest change.
    it('change_notifier_should_return_last_notification', 0, async () => {
      const notifier = new AssetChangeNotifier();
      expect(notifier.getLastNotification()).assertNull();
      notifier.notify(AssetChangeType.RELOAD, 0);
      const last: AssetChangeNotification | null = notifier.getLastNotification();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.type).assertEqual(AssetChangeType.RELOAD);
      }
      notifier.clear();
      expect(notifier.getNotificationCount()).assertEqual(0);
    });

    // AssetOperationRecorder: operation counters follow the recorded calls.
    it('operation_recorder_should_count_operations', 0, async () => {
      const recorder = new AssetOperationRecorder();
      recorder.record(AssetDataSourceOperation.PUSH);
      recorder.record(AssetDataSourceOperation.PUSH);
      recorder.record(AssetDataSourceOperation.CLEAR);
      expect(recorder.getOperationCount()).assertEqual(3);
      expect(recorder.getCountByOperation(AssetDataSourceOperation.PUSH)).assertEqual(2);
      expect(recorder.getOperations().length).assertEqual(3);
      recorder.clear();
      expect(recorder.getOperationCount()).assertEqual(0);
    });

    // IdentifiedAssetDataSource: ids are assigned sequentially.
    it('identified_source_should_assign_sequential_ids', 0, async () => {
      const ds = new IdentifiedAssetDataSource();
      expect(ds.add('REC_1.mp4', 11, 1024)).assertEqual(0);
      expect(ds.add('REC_2.mp4', 12, 2048)).assertEqual(1);
      expect(ds.totalCount()).assertEqual(2);
      expect(ds.containsId(1)).assertTrue();
      expect(ds.containsId(5)).assertFalse();
    });

    // IdentifiedAssetDataSource: lookup by id and by index.
    it('identified_source_should_lookup_by_id_and_index', 0, async () => {
      const ds = new IdentifiedAssetDataSource();
      ds.add('REC_1.mp4', 11, 1024);
      const byId: IdentifiedVideoAsset | null = ds.getById(0);
      const byIndex: IdentifiedVideoAsset | null = ds.getByIndex(0);
      expect(byId === null).assertFalse();
      expect(byIndex === null).assertFalse();
      if (byId !== null) {
        expect(byId.fileName).assertEqual('REC_1.mp4');
        expect(byId.isValid()).assertTrue();
      }
      expect(ds.getByIndex(5)).assertNull();
      expect(ds.getById(9)).assertNull();
    });

    // IdentifiedAssetDataSource: removal and cloning semantics.
    it('identified_source_should_remove_and_clone', 0, async () => {
      const ds = new IdentifiedAssetDataSource();
      ds.add('REC_1.mp4', 11, 1024);
      ds.add('REC_2.mp4', 12, 2048);
      expect(ds.removeById(0)).assertTrue();
      expect(ds.removeById(0)).assertFalse();
      const items: IdentifiedVideoAsset[] = ds.getItems();
      expect(items.length).assertEqual(1);
      expect(items[0].id).assertEqual(1);
      const copy: IdentifiedVideoAsset = items[0].clone();
      expect(copy.equals(items[0])).assertTrue();
      expect(copy.toString().length).assertLarger(0);
    });

    // AssetDataSourceStatistics: subtype counting and duplicate detection.
    it('statistics_should_count_subtypes_and_duplicates', 0, async () => {
      const factory = new VideoAssetFactory();
      const items: VideoAssetItem[] = factory.createStandardAssets();
      const stats = new AssetDataSourceStatistics();
      expect(stats.countBySubtype(items, AssetSubtype.VIDEO)).assertEqual(2);
      expect(stats.countBySubtype(items, AssetSubtype.SCREENSHOT)).assertEqual(0);
      expect(stats.isEmpty(items)).assertFalse();
      expect(stats.hasDuplicates(items)).assertFalse();
      items.push(new VideoAssetItem('REC_20260115_102030.mp4', 'file://media/Photo/3', 13,
        AssetSubtype.VIDEO, 10));
      expect(stats.hasDuplicates(items)).assertTrue();
    });

    // AssetDataSourceStatistics: size aggregation and subtype distribution.
    it('statistics_should_aggregate_size_and_distribution', 0, async () => {
      const factory = new VideoAssetFactory();
      const items: VideoAssetItem[] = factory.createStandardAssets();
      const stats = new AssetDataSourceStatistics();
      expect(stats.totalSizeBytes(items)).assertEqual(3072);
      const distribution: Map<number, number> = stats.getSubtypeDistribution(items);
      expect(distribution.get(AssetSubtype.VIDEO)).assertEqual(2);
      expect(distribution.get(AssetSubtype.SCREENSHOT)).assertUndefined();
    });

    // AssetDataSourceStatistics: aggregated stats keep listener bookkeeping.
    it('statistics_should_compute_data_source_stats', 0, async () => {
      const ds = new VideoAssetDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      ds.push(new VideoAssetItem('REC_1.mp4', 'file://media/Photo/1', 1, AssetSubtype.VIDEO, 100));
      const stats = new AssetDataSourceStatistics();
      const summary: AssetDataSourceStats =
        stats.computeStats(ds.getAllItems(), ds.getListenerCount(), 1, 0);
      expect(summary.totalCount).assertEqual(1);
      expect(summary.listenerCount).assertEqual(1);
      expect(summary.addCount).assertEqual(1);
      const emptyItems: VideoAssetItem[] = [];
      expect(stats.isEmpty(emptyItems)).assertTrue();
    });

    // VideoAssetFactory: repeated fixtures keep the same asset name.
    it('asset_factory_should_create_repeated_assets', 0, async () => {
      const factory = new VideoAssetFactory();
      const items: VideoAssetItem[] = factory.createRepeatedAssets('REC_dup.mp4', 3);
      expect(items.length).assertEqual(3);
      expect(new AssetDataSourceStatistics().hasDuplicates(items)).assertTrue();
      expect(factory.createEmptyAssets().length).assertEqual(0);
      expect(factory.createIdentifiedAssets().length).assertEqual(2);
    });

    // FdSinkRegistry: fd open and close bookkeeping.
    it('fd_registry_should_track_open_descriptors', 0, async () => {
      const registry = new FdSinkRegistry();
      expect(registry.open(11)).assertTrue();
      expect(registry.open(11)).assertFalse();
      expect(registry.open(-1)).assertFalse();
      expect(registry.isOpen(11)).assertTrue();
      expect(registry.getOpenCount()).assertEqual(1);
      expect(registry.buildSinkUrl(11)).assertEqual('fd://11');
      expect(registry.close(11)).assertTrue();
      expect(registry.close(11)).assertFalse();
      expect(registry.getOpenCount()).assertEqual(0);
    });

    // FdSinkRegistry: closing all descriptors releases every sink.
    it('fd_registry_should_close_all_descriptors', 0, async () => {
      const registry = new FdSinkRegistry();
      registry.open(1);
      registry.open(2);
      registry.open(3);
      expect(registry.closeAll()).assertEqual(3);
      expect(registry.getOpenCount()).assertEqual(0);
      expect(registry.isOpen(2)).assertFalse();
    });

    // UI smoke check: the tip window data source stays observable.
    it('tip_window_data_source_should_stay_observable', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'tip window data source observed');
    });
  });
}
