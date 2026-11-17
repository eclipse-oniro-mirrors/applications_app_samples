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

import { describe, it, expect, beforeEach } from '@ohos/hypium'

// Resources owned by one recording session.
enum RecorderResourceKind {
  FILE_DESCRIPTOR = 'file_descriptor',
  PHOTO_ASSET = 'photo_asset',
  FLOATING_WINDOW = 'floating_window',
  STATE_CALLBACK = 'state_callback',
  LOCAL_STORAGE = 'local_storage'
}

// One acquired resource tracked by the ledger.
interface RecorderResourceRecord {
  kind: RecorderResourceKind
  resourceId: string
  sizeBytes: number
  acquiredAt: number
  released: boolean
}

// Aggregated resource counters of one session.
interface ResourceSummary {
  totalAcquired: number
  totalReleased: number
  activeResources: number
  fileDescriptorCount: number
  windowCount: number
  callbackCount: number
  currentBytes: number
  peakBytes: number
}

// Ledger that mirrors the resource ownership of SRManager and WindowMgr.
// Every acquired resource must be released, otherwise the leak check fails.
class RecorderResourceLedger {
  private records: RecorderResourceRecord[] = []
  private clock: number = 1700000000000
  private currentBytes: number = 0
  private peakBytes: number = 0

  public acquire(kind: RecorderResourceKind, resourceId: string, sizeBytes: number): boolean {
    for (const record of this.records) {
      if (!record.released && record.resourceId === resourceId) {
        return false
      }
    }
    const record: RecorderResourceRecord = {
      kind: kind,
      resourceId: resourceId,
      sizeBytes: sizeBytes,
      acquiredAt: this.clock,
      released: false
    }
    this.records.push(record)
    this.clock += 5
    this.currentBytes += sizeBytes
    if (this.currentBytes > this.peakBytes) {
      this.peakBytes = this.currentBytes
    }
    return true
  }

  public release(resourceId: string): boolean {
    for (const record of this.records) {
      if (!record.released && record.resourceId === resourceId) {
        record.released = true
        this.currentBytes -= record.sizeBytes
        return true
      }
    }
    return false
  }

  public releaseKind(kind: RecorderResourceKind): number {
    let released = 0
    for (const record of this.records) {
      if (!record.released && record.kind === kind) {
        record.released = true
        this.currentBytes -= record.sizeBytes
        released += 1
      }
    }
    return released
  }

  public releaseAll(): number {
    let released = 0
    for (const record of this.records) {
      if (!record.released) {
        record.released = true
        released += 1
      }
    }
    this.currentBytes = 0
    return released
  }

  public countKind(kind: RecorderResourceKind): number {
    let count = 0
    for (const record of this.records) {
      if (record.kind === kind) {
        count += 1
      }
    }
    return count
  }

  public countActiveKind(kind: RecorderResourceKind): number {
    let count = 0
    for (const record of this.records) {
      if (!record.released && record.kind === kind) {
        count += 1
      }
    }
    return count
  }

  public countActive(): number {
    let count = 0
    for (const record of this.records) {
      if (!record.released) {
        count += 1
      }
    }
    return count
  }

  public hasLeak(): boolean {
    return this.countActive() > 0
  }

  public getCurrentBytes(): number {
    return this.currentBytes
  }

  public getPeakBytes(): number {
    return this.peakBytes
  }

  public buildSummary(): ResourceSummary {
    const summary: ResourceSummary = {
      totalAcquired: this.records.length,
      totalReleased: this.records.length - this.countActive(),
      activeResources: this.countActive(),
      fileDescriptorCount: this.countActiveKind(RecorderResourceKind.FILE_DESCRIPTOR),
      windowCount: this.countActiveKind(RecorderResourceKind.FLOATING_WINDOW),
      callbackCount: this.countActiveKind(RecorderResourceKind.STATE_CALLBACK),
      currentBytes: this.currentBytes,
      peakBytes: this.peakBytes
    }
    return summary
  }

  public reset(): void {
    this.records = []
    this.clock = 1700000000000
    this.currentBytes = 0
    this.peakBytes = 0
  }
}

// File descriptors opened for the created video assets.
// The production code opens the uri of PhotoAccessHelper.createAsset and
// passes 'fd://<fd>' to SRApi.startRecording.
class FileDescriptorPool {
  private openFds: number[] = []
  private nextFd: number = 100
  private openCount: number = 0
  private closeCount: number = 0

  public open(): number {
    const fd = this.nextFd
    this.nextFd += 1
    this.openFds.push(fd)
    this.openCount += 1
    return fd
  }

  public close(fd: number): boolean {
    for (let i = 0; i < this.openFds.length; i++) {
      if (this.openFds[i] === fd) {
        this.openFds.splice(i, 1)
        this.closeCount += 1
        return true
      }
    }
    return false
  }

  public closeAll(): number {
    const closed = this.openFds.length
    this.openFds = []
    this.closeCount += closed
    return closed
  }

  public getOpenCount(): number {
    return this.openFds.length
  }

  public getOpenTotal(): number {
    return this.openCount
  }

  public getCloseTotal(): number {
    return this.closeCount
  }

  public buildStartUrl(fd: number): string {
    return `fd://${fd}`
  }
}

// Photo assets created for finished recordings.
class PhotoAssetPool {
  private assets: string[] = []
  private releasedAssets: string[] = []

  public create(fileName: string): string {
    const uri = `file://media/Photo/${this.assets.length + 1}/${fileName}`
    this.assets.push(uri)
    return uri
  }

  public release(uri: string): boolean {
    for (let i = 0; i < this.assets.length; i++) {
      if (this.assets[i] === uri) {
        this.assets.splice(i, 1)
        this.releasedAssets.push(uri)
        return true
      }
    }
    return false
  }

  public releaseAll(): number {
    const released = this.assets.length
    for (const uri of this.assets) {
      this.releasedAssets.push(uri)
    }
    this.assets = []
    return released
  }

  public getActiveCount(): number {
    return this.assets.length
  }

  public getReleasedCount(): number {
    return this.releasedAssets.length
  }
}

// Callback registry of the SRApi.onStateChange subscription.
class RecorderCallbackRegistry {
  private callbacks: Map<string, () => void> = new Map<string, () => void>()
  private firedCount: Map<string, number> = new Map<string, number>()

  public register(name: string, callback: () => void): boolean {
    if (this.callbacks.has(name)) {
      return false
    }
    this.callbacks.set(name, callback)
    this.firedCount.set(name, 0)
    return true
  }

  public fire(name: string): boolean {
    const callback = this.callbacks.get(name)
    if (callback === undefined) {
      return false
    }
    callback()
    const previous = this.firedCount.get(name)
    this.firedCount.set(name, previous === undefined ? 1 : previous + 1)
    return true
  }

  public unregister(name: string): boolean {
    if (!this.callbacks.has(name)) {
      return false
    }
    this.callbacks.delete(name)
    this.firedCount.delete(name)
    return true
  }

  public clear(): number {
    const size = this.callbacks.size
    this.callbacks.clear()
    this.firedCount.clear()
    return size
  }

  public size(): number {
    return this.callbacks.size
  }

  public getFiredCount(name: string): number {
    const count = this.firedCount.get(name)
    if (count === undefined) {
      return 0
    }
    return count
  }
}

export default function resourceManagementTest(): void {
  describe('ResourceManagement_Test', () => {
    let ledger: RecorderResourceLedger
    let fdPool: FileDescriptorPool
    let photoPool: PhotoAssetPool
    let callbacks: RecorderCallbackRegistry

    beforeEach(() => {
      ledger = new RecorderResourceLedger()
      fdPool = new FileDescriptorPool()
      photoPool = new PhotoAssetPool()
      callbacks = new RecorderCallbackRegistry()
    })

    it('ledger_should_acquire_file_descriptor', 0, () => {
      expect(ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)).assertTrue()
      expect(ledger.countKind(RecorderResourceKind.FILE_DESCRIPTOR)).assertEqual(1)
      expect(ledger.countActive()).assertEqual(1)
      expect(ledger.hasLeak()).assertTrue()
    })

    it('ledger_should_ignore_duplicate_active_resource', 0, () => {
      expect(ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)).assertTrue()
      expect(ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)).assertFalse()
      expect(ledger.countKind(RecorderResourceKind.FILE_DESCRIPTOR)).assertEqual(1)
    })

    it('ledger_should_release_file_descriptor', 0, () => {
      ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)
      expect(ledger.release('fd_100')).assertTrue()
      expect(ledger.countActiveKind(RecorderResourceKind.FILE_DESCRIPTOR)).assertEqual(0)
      expect(ledger.hasLeak()).assertFalse()
    })

    it('ledger_should_reject_release_of_unknown_resource', 0, () => {
      expect(ledger.release('missing_resource')).assertFalse()
      expect(ledger.countActive()).assertEqual(0)
    })

    it('ledger_should_release_resources_by_kind', 0, () => {
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 1024)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'tipWindow', 2048)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      expect(ledger.releaseKind(RecorderResourceKind.FLOATING_WINDOW)).assertEqual(2)
      expect(ledger.countActiveKind(RecorderResourceKind.FLOATING_WINDOW)).assertEqual(0)
      expect(ledger.countActiveKind(RecorderResourceKind.PHOTO_ASSET)).assertEqual(1)
    })

    it('ledger_should_release_all_resources', 0, () => {
      ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      ledger.acquire(RecorderResourceKind.STATE_CALLBACK, 'onStateChange', 128)
      expect(ledger.releaseAll()).assertEqual(3)
      expect(ledger.countActive()).assertEqual(0)
      expect(ledger.hasLeak()).assertFalse()
      expect(ledger.getCurrentBytes()).assertEqual(0)
    })

    it('ledger_should_count_resources_by_kind', 0, () => {
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 1024)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'resolutionWindow', 512)
      ledger.acquire(RecorderResourceKind.STATE_CALLBACK, 'onStateChange', 64)
      expect(ledger.countKind(RecorderResourceKind.FLOATING_WINDOW)).assertEqual(2)
      expect(ledger.countKind(RecorderResourceKind.STATE_CALLBACK)).assertEqual(1)
      expect(ledger.countKind(RecorderResourceKind.PHOTO_ASSET)).assertEqual(0)
    })

    it('ledger_should_track_current_bytes', 0, () => {
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_2', 8192)
      expect(ledger.getCurrentBytes()).assertEqual(12288)
      ledger.release('photo_1')
      expect(ledger.getCurrentBytes()).assertEqual(8192)
    })

    it('ledger_should_track_peak_bytes', 0, () => {
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_2', 8192)
      ledger.releaseAll()
      expect(ledger.getCurrentBytes()).assertEqual(0)
      expect(ledger.getPeakBytes()).assertEqual(12288)
    })

    it('ledger_should_build_resource_summary', 0, () => {
      ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 1024)
      ledger.acquire(RecorderResourceKind.STATE_CALLBACK, 'onStateChange', 64)
      ledger.release('fd_100')
      const summary: ResourceSummary = ledger.buildSummary()
      expect(summary.totalAcquired).assertEqual(3)
      expect(summary.totalReleased).assertEqual(1)
      expect(summary.activeResources).assertEqual(2)
      expect(summary.fileDescriptorCount).assertEqual(0)
      expect(summary.windowCount).assertEqual(1)
      expect(summary.callbackCount).assertEqual(1)
    })

    it('ledger_should_reset_all_counters', 0, () => {
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      ledger.reset()
      expect(ledger.countActive()).assertEqual(0)
      expect(ledger.getCurrentBytes()).assertEqual(0)
      expect(ledger.getPeakBytes()).assertEqual(0)
      expect(ledger.hasLeak()).assertFalse()
    })

    it('fd_pool_should_open_sequential_descriptors', 0, () => {
      const first = fdPool.open()
      const second = fdPool.open()
      expect(first).assertEqual(100)
      expect(second).assertEqual(101)
      expect(fdPool.getOpenCount()).assertEqual(2)
    })

    it('fd_pool_should_close_descriptor', 0, () => {
      const fd = fdPool.open()
      expect(fdPool.close(fd)).assertTrue()
      expect(fdPool.getOpenCount()).assertEqual(0)
      expect(fdPool.getCloseTotal()).assertEqual(1)
    })

    it('fd_pool_should_reject_double_close', 0, () => {
      const fd = fdPool.open()
      expect(fdPool.close(fd)).assertTrue()
      expect(fdPool.close(fd)).assertFalse()
      expect(fdPool.getCloseTotal()).assertEqual(1)
    })

    it('fd_pool_should_close_all_descriptors', 0, () => {
      fdPool.open()
      fdPool.open()
      fdPool.open()
      expect(fdPool.closeAll()).assertEqual(3)
      expect(fdPool.getOpenCount()).assertEqual(0)
      expect(fdPool.getOpenTotal()).assertEqual(3)
    })

    it('fd_pool_should_build_fd_url', 0, () => {
      const fd = fdPool.open()
      expect(fdPool.buildStartUrl(fd)).assertEqual('fd://100')
      expect(fdPool.buildStartUrl(200)).assertEqual('fd://200')
    })

    it('photo_pool_should_create_asset', 0, () => {
      const uri = photoPool.create('REC_20260101_120000.mp4')
      expect(uri).assertContain('REC_20260101_120000.mp4')
      expect(photoPool.getActiveCount()).assertEqual(1)
      expect(photoPool.getReleasedCount()).assertEqual(0)
    })

    it('photo_pool_should_release_asset', 0, () => {
      const uri = photoPool.create('REC_20260101_120000.mp4')
      expect(photoPool.release(uri)).assertTrue()
      expect(photoPool.getActiveCount()).assertEqual(0)
      expect(photoPool.getReleasedCount()).assertEqual(1)
    })

    it('photo_pool_should_reject_unknown_asset', 0, () => {
      expect(photoPool.release('file://media/Photo/missing')).assertFalse()
      expect(photoPool.getReleasedCount()).assertEqual(0)
    })

    it('photo_pool_should_release_all_assets', 0, () => {
      photoPool.create('REC_20260101_120000.mp4')
      photoPool.create('REC_20260101_120100.mp4')
      expect(photoPool.releaseAll()).assertEqual(2)
      expect(photoPool.getActiveCount()).assertEqual(0)
      expect(photoPool.getReleasedCount()).assertEqual(2)
    })

    it('callback_registry_should_register_once', 0, () => {
      expect(callbacks.register('onStateChange', () => {})).assertTrue()
      expect(callbacks.register('onStateChange', () => {})).assertFalse()
      expect(callbacks.size()).assertEqual(1)
    })

    it('callback_registry_should_fire_callback', 0, () => {
      let fired = 0
      callbacks.register('onStateChange', () => {
        fired += 1
      })
      expect(callbacks.fire('onStateChange')).assertTrue()
      expect(callbacks.fire('onStateChange')).assertTrue()
      expect(fired).assertEqual(2)
      expect(callbacks.getFiredCount('onStateChange')).assertEqual(2)
    })

    it('callback_registry_should_ignore_unknown_callback', 0, () => {
      expect(callbacks.fire('missingCallback')).assertFalse()
      expect(callbacks.getFiredCount('missingCallback')).assertEqual(0)
    })

    it('callback_registry_should_unregister_callback', 0, () => {
      callbacks.register('onStateChange', () => {})
      expect(callbacks.unregister('onStateChange')).assertTrue()
      expect(callbacks.size()).assertEqual(0)
      expect(callbacks.fire('onStateChange')).assertFalse()
    })

    it('callback_registry_should_clear_all_callbacks', 0, () => {
      callbacks.register('first', () => {})
      callbacks.register('second', () => {})
      expect(callbacks.clear()).assertEqual(2)
      expect(callbacks.size()).assertEqual(0)
      expect(callbacks.clear()).assertEqual(0)
    })

    it('window_release_should_destroy_cached_windows', 0, () => {
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 1024)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'tipWindow', 2048)
      expect(ledger.releaseKind(RecorderResourceKind.FLOATING_WINDOW)).assertEqual(2)
      const summary = ledger.buildSummary()
      expect(summary.windowCount).assertEqual(0)
      expect(summary.activeResources).assertEqual(0)
    })

    it('resource_cleanup_should_cover_all_kinds', 0, () => {
      ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, 'fd_100', 0)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, 'photo_1', 4096)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 1024)
      ledger.acquire(RecorderResourceKind.STATE_CALLBACK, 'onStateChange', 64)
      ledger.acquire(RecorderResourceKind.LOCAL_STORAGE, 'recorderState', 256)

      const fd = fdPool.open()
      callbacks.register('onStateChange', () => {})
      photoPool.create('REC_20260101_120000.mp4')

      expect(ledger.releaseAll()).assertEqual(5)
      expect(fdPool.close(fd)).assertTrue()
      expect(callbacks.clear()).assertEqual(1)
      expect(photoPool.releaseAll()).assertEqual(1)

      expect(ledger.hasLeak()).assertFalse()
      expect(fdPool.getOpenCount()).assertEqual(0)
      expect(callbacks.size()).assertEqual(0)
      expect(photoPool.getActiveCount()).assertEqual(0)
    })

    it('comprehensive_resource_management_scenario', 0, () => {
      const fd = fdPool.open()
      const uri = photoPool.create('REC_20260101_120000.mp4')
      callbacks.register('onStateChange', () => {})

      ledger.acquire(RecorderResourceKind.FILE_DESCRIPTOR, `fd_${fd}`, 0)
      ledger.acquire(RecorderResourceKind.PHOTO_ASSET, uri, 8192)
      ledger.acquire(RecorderResourceKind.STATE_CALLBACK, 'onStateChange', 128)
      ledger.acquire(RecorderResourceKind.FLOATING_WINDOW, 'timerWindow', 2048)

      expect(ledger.buildSummary().activeResources).assertEqual(4)
      expect(ledger.getPeakBytes()).assertEqual(10368)

      expect(ledger.release(`fd_${fd}`)).assertTrue()
      expect(fdPool.close(fd)).assertTrue()
      expect(photoPool.release(uri)).assertTrue()
      expect(ledger.release(uri)).assertTrue()
      expect(callbacks.clear()).assertEqual(1)
      expect(ledger.releaseKind(RecorderResourceKind.STATE_CALLBACK)).assertEqual(1)
      expect(ledger.releaseKind(RecorderResourceKind.FLOATING_WINDOW)).assertEqual(1)

      const summary = ledger.buildSummary()
      expect(summary.totalAcquired).assertEqual(4)
      expect(summary.totalReleased).assertEqual(4)
      expect(summary.activeResources).assertEqual(0)
      expect(summary.currentBytes).assertEqual(0)
      expect(ledger.hasLeak()).assertFalse()
    })
  })
}
