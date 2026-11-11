/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { PbapProfileManager } from 'library';
import { PbapManagerStatistics, ManagerHealthStatus, ManagerFilterCriteria, OperationHistoryEntry } from 'library';
import { PbapModel } from 'library';
import { BluetoothConstants, BluetoothConnectionState } from 'library';
import { PageConstants } from 'library';
import { Logger } from 'library';
import { router } from '@kit.ArkUI';

/**
 * @interface PbapPageState
 * @description State management interface for the Pbap page.
 */
interface PbapPageState {
  isLoading: boolean;
  connectionState: BluetoothConnectionState;
  model: PbapModel | null;
  connectedDevices: string[];
  operationHistory: OperationHistoryEntry[];
  statistics: PbapManagerStatistics | null;
  healthStatus: ManagerHealthStatus | null;
  errorMessage: string;
  showAdvancedOptions: boolean;
  currentTabIndex: number;
  searchKeyword: string;
  sortOrder: string;
  filterCriteria: ManagerFilterCriteria;
  currentPage: number;
  itemsPerPage: number;
  totalItems: number;
}

/**
 * @interface PbapDeviceItem
 * @description Represents a device item in the device list.
 */
interface PbapDeviceItem {
  deviceId: string;
  deviceName: string;
  macAddress: string;
  isConnected: boolean;
  rssi: number;
  deviceType: string;
  lastSeen: number;
  batteryLevel: number;
  supportsProfile: boolean;
  manufacturer: string;
  model: string;
  firmwareVersion: string;
  iconResource: string;
  description: string;
  isFavorite: boolean;
  tags: string[];
}

/**
 * @interface PbapOperationLogEntry
 * @description Represents an operation log entry for display.
 */
interface PbapOperationLogEntry {
  id: string;
  operation: string;
  timestamp: number;
  success: boolean;
  details: string;
  durationMs: number;
  deviceId: string;
  errorCode: number;
  errorMessage: string;
  metadata: Map<string, string>;
}

/**
 * @class PbapPage
 * @description Main page for managing Phone Book Access Profile (Pbap) Bluetooth connections.
 * @since 26.0.0
 */
@Entry
@Component
struct PbapPage {
  private manager: PbapProfileManager = new PbapProfileManager();
  @State state: PbapPageState = {
    isLoading: false,
    connectionState: BluetoothConnectionState.DISCONNECTED,
    model: null,
    connectedDevices: [],
    operationHistory: [],
    statistics: null,
    healthStatus: null,
    errorMessage: '',
    showAdvancedOptions: false,
    currentTabIndex: 0,
    searchKeyword: '',
    sortOrder: 'name',
    filterCriteria: {},
    currentPage: 1,
    itemsPerPage: 10,
    totalItems: 0
  };
  @State deviceList: PbapDeviceItem[] = [];
  @State operationLog: PbapOperationLogEntry[] = [];
  @State showConnectDialog: boolean = false;
  @State connectDeviceId: string = '';
  @State selectedDeviceId: string = '';
  @State refreshCounter: number = 0;
  @State isAnimating: boolean = false;
  @State toastMessage: string = '';
  @State showToast: boolean = false;
  @State scrollPosition: number = 0;
  @State sortAscending: boolean = true;
  @State filterByConnection: string = 'all';
  @State filterByType: string = 'all';
  @State autoRefreshInterval: number = 5000;
  @State autoRefreshEnabled: boolean = true;
  private refreshTimerId: number = -1;

  async aboutToAppear(): Promise<void> {
    hiTraceMeter.startTrace('PbapPage_aboutToAppear', 0);
    Logger.info(BluetoothConstants.TAG, 'PbapPage aboutToAppear');
    try {
      this.state.isLoading = true;
      await this.manager.initialize();
      await this.refreshData();
      this.setupEventListeners();
      this.startAutoRefresh();
      this.state.isLoading = false;
      hilog.info(0xF830, BluetoothConstants.TAG, 'PbapPage initialized successfully');
    } catch (error) {
      this.state.errorMessage = 'Initialization failed: ' + JSON.stringify(error);
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s initialization error: %{public}s', 'PbapPage', JSON.stringify(error));
    } finally {
      this.state.isLoading = false;
      hiTraceMeter.finishTrace('PbapPage_aboutToAppear', 0);
    }
  }

  async aboutToDisappear(): Promise<void> {
    Logger.info(BluetoothConstants.TAG, 'PbapPage aboutToDisappear');
    this.stopAutoRefresh();
    await this.manager.destroy();
  }

  private setupEventListeners(): void {
    this.manager.addStateCallback((state: BluetoothConnectionState) => {
      this.state.connectionState = state;
      this.refreshData();
    });
    this.manager.addDataCallback(() => {
      this.state.model = this.manager.getModel();
      this.refreshCounter++;
    });
  }

  private startAutoRefresh(): void {
    if (this.autoRefreshEnabled && this.refreshTimerId === -1) {
      this.refreshTimerId = setInterval(() => {
        this.refreshData();
      }, this.autoRefreshInterval);
    }
  }

  private stopAutoRefresh(): void {
    if (this.refreshTimerId !== -1) {
      clearInterval(this.refreshTimerId);
      this.refreshTimerId = -1;
    }
  }

  async refreshData(): Promise<void> {
    try {
      this.state.connectionState = this.manager.getService().getConnectionState();
      this.state.model = this.manager.getModel();
      this.state.connectedDevices = this.manager.getConnectedDeviceIds();
      this.state.operationHistory = this.manager.getService().getOperationHistory();
      this.state.statistics = this.manager.getStatistics();
      this.state.healthStatus = this.manager.getHealthStatus();
      this.state.totalItems = this.state.connectedDevices.length;
      await this.updateDeviceList();
      await this.updateOperationLog();
    } catch (error) {
      hilog.error(0xF830, BluetoothConstants.TAG, '%{public}s refresh error: %{public}s', 'PbapPage', JSON.stringify(error));
    }
  }

  async updateDeviceList(): Promise<void> {
    const devices: PbapDeviceItem[] = [];
    const connectedIds = this.manager.getConnectedDeviceIds();
    for (const deviceId of connectedIds) {
      devices.push({
        deviceId: deviceId,
        deviceName: 'Device_' + deviceId.substring(0, 8),
        macAddress: 'AA:BB:CC:DD:EE:FF',
        isConnected: true,
        rssi: -50,
        deviceType: 'Pbap',
        lastSeen: Date.now(),
        batteryLevel: 85,
        supportsProfile: true,
        manufacturer: 'Mock Manufacturer',
        model: 'Mock Model',
        firmwareVersion: '1.0.0',
        iconResource: 'bluetooth',
        description: 'Phone Book Access Profile device',
        isFavorite: false,
        tags: ['Pbap', 'connected']
      });
    }
    this.deviceList = devices;
  }

  async updateOperationLog(): Promise<void> {
    const records = this.manager.getOperationRecords();
    const logs: PbapOperationLogEntry[] = [];
    for (const record of records) {
      logs.push({
        id: record.operationId,
        operation: record.operationName,
        timestamp: record.startTime,
        success: record.success,
        details: record.details,
        durationMs: record.durationMs,
        deviceId: '',
        errorCode: 0,
        errorMessage: record.errorMessage,
        metadata: new Map()
      });
    }
    this.operationLog = logs;
  }

  async handleConnectDevice(): Promise<void> {
    if (!this.connectDeviceId || this.connectDeviceId.length === 0) {
      this.showToastMessage('Please enter a device ID');
      return;
    }
    try {
      this.state.isLoading = true;
      this.isAnimating = true;
      const result = await this.manager.connect(this.connectDeviceId);
      if (result) {
        this.showToastMessage('Connected successfully');
        this.connectDeviceId = '';
        this.showConnectDialog = false;
        await this.refreshData();
      } else {
        this.showToastMessage('Connection failed');
      }
    } catch (error) {
      this.showToastMessage('Connection error: ' + JSON.stringify(error));
    } finally {
      this.state.isLoading = false;
      this.isAnimating = false;
    }
  }

  async handleDisconnectDevice(deviceId: string): Promise<void> {
    try {
      this.state.isLoading = true;
      const result = await this.manager.disconnect(deviceId);
      if (result) {
        this.showToastMessage('Disconnected successfully');
        await this.refreshData();
      } else {
        this.showToastMessage('Disconnection failed');
      }
    } catch (error) {
      this.showToastMessage('Disconnection error: ' + JSON.stringify(error));
    } finally {
      this.state.isLoading = false;
    }
  }

  async handleRefresh(): Promise<void> {
    try {
      this.isAnimating = true;
      await this.refreshData();
      this.showToastMessage('Data refreshed');
    } catch (error) {
      this.showToastMessage('Refresh failed: ' + JSON.stringify(error));
    } finally {
      this.isAnimating = false;
    }
  }

  async handleReset(): Promise<void> {
    try {
      this.state.isLoading = true;
      await this.manager.reset();
      await this.refreshData();
      this.showToastMessage('Manager reset');
    } catch (error) {
      this.showToastMessage('Reset failed: ' + JSON.stringify(error));
    } finally {
      this.state.isLoading = false;
    }
  }

  private showToastMessage(message: string): void {
    this.toastMessage = message;
    this.showToast = true;
    setTimeout(() => {
      this.showToast = false;
    }, 3000);
  }

  filterDevices(): PbapDeviceItem[] {
    let filtered = [...this.deviceList];
    if (this.state.searchKeyword) {
      const keyword = this.state.searchKeyword.toLowerCase();
      filtered = filtered.filter(d =>
        d.deviceName.toLowerCase().includes(keyword) ||
        d.deviceId.toLowerCase().includes(keyword) ||
        d.macAddress.toLowerCase().includes(keyword)
      );
    }
    if (this.filterByConnection !== 'all') {
      const isConnected = this.filterByConnection === 'connected';
      filtered = filtered.filter(d => d.isConnected === isConnected);
    }
    if (this.filterByType !== 'all') {
      filtered = filtered.filter(d => d.deviceType === this.filterByType);
    }
    return filtered;
  }

  sortDevices(devices: PbapDeviceItem[]): PbapDeviceItem[] {
    const sorted = [...devices];
    sorted.sort((a, b) => {
      let comparison = 0;
      switch (this.state.sortOrder) {
        case 'name':
          comparison = a.deviceName.localeCompare(b.deviceName);
          break;
        case 'rssi':
          comparison = a.rssi - b.rssi;
          break;
        case 'battery':
          comparison = a.batteryLevel - b.batteryLevel;
          break;
        case 'lastSeen':
          comparison = a.lastSeen - b.lastSeen;
          break;
        default:
          comparison = 0;
      }
      return this.sortAscending ? comparison : -comparison;
    });
    return sorted;
  }

  getPaginatedDevices(devices: PbapDeviceItem[]): PbapDeviceItem[] {
    const startIndex = (this.state.currentPage - 1) * this.state.itemsPerPage;
    const endIndex = startIndex + this.state.itemsPerPage;
    return devices.slice(startIndex, endIndex);
  }

  getTotalPages(totalItems: number): number {
    return Math.ceil(totalItems / this.state.itemsPerPage);
  }

  handlePageChange(page: number): void {
    this.state.currentPage = page;
  }

  handleSortChange(sortOrder: string): void {
    if (this.state.sortOrder === sortOrder) {
      this.sortAscending = !this.sortAscending;
    } else {
      this.state.sortOrder = sortOrder;
      this.sortAscending = true;
    }
  }

  handleFilterChange(filterType: string, value: string): void {
    if (filterType === 'connection') {
      this.filterByConnection = value;
    } else if (filterType === 'type') {
      this.filterByType = value;
    }
    this.state.currentPage = 1;
  }

  getConnectionStateLabel(state: BluetoothConnectionState): string {
    switch (state) {
      case BluetoothConnectionState.DISCONNECTED:
        return 'Disconnected';
      case BluetoothConnectionState.CONNECTING:
        return 'Connecting...';
      case BluetoothConnectionState.CONNECTED:
        return 'Connected';
      case BluetoothConnectionState.DISCONNECTING:
        return 'Disconnecting...';
      default:
        return 'Unknown';
    }
  }

  getConnectionStateColor(state: BluetoothConnectionState): string {
    switch (state) {
      case BluetoothConnectionState.DISCONNECTED:
        return '#999999';
      case BluetoothConnectionState.CONNECTING:
        return '#FFA500';
      case BluetoothConnectionState.CONNECTED:
        return '#00FF00';
      case BluetoothConnectionState.DISCONNECTING:
        return '#FFA500';
      default:
        return '#999999';
    }
  }

  formatTimestamp(timestamp: number): string {
    const date = new Date(timestamp);
    return date.toLocaleString();
  }

  formatDuration(durationMs: number): string {
    if (durationMs < 1000) {
      return durationMs + 'ms';
    } else if (durationMs < 60000) {
      return (durationMs / 1000).toFixed(1) + 's';
    } else {
      return Math.floor(durationMs / 60000) + 'm ' + Math.floor((durationMs % 60000) / 1000) + 's';
    }
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.title_pbap_full'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
        Blank()
        Button($r('app.string.p_btn_refresh'))
          .onClick(() => {
            this.handleRefresh();
          })
          .backgroundColor('#007DFF')
          .fontColor('#FFFFFF')
          .margin({ right: 10 })
        Button($r('app.string.p_btn_connect'))
          .onClick(() => {
            this.showConnectDialog = true;
          })
          .backgroundColor('#00C853')
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height(60)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#0A59F7')

      Column() {
        Row() {
          Text($r('app.string.p_connection_status'))
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(FontWeight.Medium)
          Blank()
          Text(this.getConnectionStateLabel(this.state.connectionState))
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontColor(this.getConnectionStateColor(this.state.connectionState))
        }
        .width('100%')
        .margin({ bottom: 10 })

        Row() {
          Text($r('app.string.p_connected_devices_label'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Text(this.state.connectedDevices.length.toString())
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 10 })
        }
        .width('100%')

        if (this.state.healthStatus) {
          Row() {
            Text($r('app.string.p_health_score_label'))
              .fontSize(PageConstants.FONT_SIZE_BODY)
            Text(((this.state.healthStatus as ManagerHealthStatus).healthScore).toString() + '/100')
              .fontSize(PageConstants.FONT_SIZE_BODY)
              .fontWeight(FontWeight.Bold)
              .margin({ left: 10 })
          }
          .width('100%')
          .margin({ top: 5 })
        }
      }
      .width('90%')
      .padding(15)
      .margin({ top: 15 })
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          this.OverviewTab()
        }
        .tabBar($r('app.string.p_tab_overview'))

        TabContent() {
          this.DevicesTab()
        }
        .tabBar($r('app.string.p_tab_devices'))

        TabContent() {
          this.OperationsTab()
        }
        .tabBar($r('app.string.p_tab_operations'))

        TabContent() {
          this.HistoryTab()
        }
        .tabBar($r('app.string.p_tab_history'))

        TabContent() {
          this.StatisticsTab()
        }
        .tabBar($r('app.string.p_tab_statistics'))

        TabContent() {
          this.SettingsTab()
        }
        .tabBar($r('app.string.p_tab_settings'))
      }
      .onChange((index: number) => {
        this.state.currentTabIndex = index;
      })
      .width('100%')
      .layoutWeight(1)

      if (this.state.isLoading || this.isAnimating) {
        LoadingProgress()
          .width(50)
          .height(50)
          .position({ x: '45%', y: '45%' })
      }

      if (this.showToast) {
        Text(this.toastMessage)
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor('#FFFFFF')
          .backgroundColor('rgba(0, 0, 0, 0.7)')
          .padding(10)
          .borderRadius(5)
          .position({ x: '25%', y: '90%' })
      }

      if (this.showConnectDialog) {
        Column() {
          Text($r('app.string.p_connect_to_device'))
            .fontSize(PageConstants.FONT_SIZE_TITLE)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 20 })
          TextInput({ placeholder: $r('app.string.p_enter_device_id') })
            .onChange((value: string) => {
              this.connectDeviceId = value;
            })
            .width('100%')
            .margin({ bottom: 15 })
          Row() {
            Button($r('app.string.p_btn_cancel'))
              .onClick(() => {
                this.showConnectDialog = false;
                this.connectDeviceId = '';
              })
              .backgroundColor('#999999')
              .margin({ right: 10 })
            Button($r('app.string.p_btn_connect'))
              .onClick(() => {
                this.handleConnectDevice();
              })
              .backgroundColor('#007DFF')
          }
          .width('100%')
          .justifyContent(FlexAlign.End)
        }
        .width('80%')
        .padding(20)
        .backgroundColor('#FFFFFF')
        .borderRadius(10)
        .position({ x: '10%', y: '30%' })
        .shadow({ radius: 10, color: 'rgba(0,0,0,0.3)', offsetX: 0, offsetY: 5 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }

  @Builder
  OverviewTab() {
    Scroll() {
      Column() {
        Text($r('app.string.p_tab_overview'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Grid() {
          GridItem() {
            this.StatCard($r('app.string.p_connected_devices'), this.state.connectedDevices.length.toString(), '#007DFF')
          }
          GridItem() {
            this.StatCard($r('app.string.p_tab_operations'), this.state.operationHistory.length.toString(), '#00C853')
          }
          GridItem() {
            this.StatCard($r('app.string.p_health_score'), this.state.healthStatus ? ((this.state.healthStatus as ManagerHealthStatus).healthScore).toString() : 'N/A', '#FF6B35')
          }
          GridItem() {
            this.StatCard($r('app.string.p_status'), this.getConnectionStateLabel(this.state.connectionState), '#9C27B0')
          }
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(15)
        .columnsGap(15)
        .width('100%')
        .height(200)
        .margin({ bottom: 20 })

        Text($r('app.string.p_recent_activity'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        List() {
          ForEach(this.state.operationHistory.slice(-5).reverse(), (item: OperationHistoryEntry) => {
            ListItem() {
              Row() {
                Text(item.operation)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(FontWeight.Medium)
                Blank()
                Text(item.success ? '✓' : '✗')
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontColor(item.success ? '#00C853' : '#FF0000')
              }
              .width('100%')
              .padding(10)
              .backgroundColor('#F5F5F5')
              .borderRadius(5)
              .margin({ bottom: 5 })
            }
          })
        }
        .width('100%')
        .height(300)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  DevicesTab() {
    Column() {
      Row() {
        TextInput({ placeholder: $r('app.string.p_search_devices') })
          .onChange((value: string) => {
            this.state.searchKeyword = value;
          })
          .width('60%')
          .margin({ right: 10 })
        Select([
          { value: 'all' },
          { value: 'connected' },
          { value: 'disconnected' }
        ])
          .selected(0)
          .value('All')
          .onSelect((index: number) => {
            const values = ['all', 'connected', 'disconnected'];
            this.handleFilterChange('connection', values[index]);
          })
          .width('35%')
      }
      .width('100%')
      .padding(10)

      Row() {
        Text($r('app.string.p_sort_by'))
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .margin({ right: 10 })
        Button($r('app.string.p_btn_name'))
          .onClick(() => this.handleSortChange('name'))
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .height(30)
          .margin({ right: 5 })
        Button($r('app.string.p_rssi'))
          .onClick(() => this.handleSortChange('rssi'))
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .height(30)
          .margin({ right: 5 })
        Button($r('app.string.p_battery'))
          .onClick(() => this.handleSortChange('battery'))
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .height(30)
      }
      .width('100%')
      .padding({ left: 10, right: 10, bottom: 10 })

      List() {
        ForEach(this.getPaginatedDevices(this.sortDevices(this.filterDevices())), (device: PbapDeviceItem) => {
          ListItem() {
            this.DeviceCard(device)
          }
        })
      }
      .width('100%')
      .layoutWeight(1)

      if (this.getTotalPages(this.filterDevices().length) > 1) {
        Row() {
          Button('<')
            .onClick(() => {
              if (this.state.currentPage > 1) {
                this.handlePageChange(this.state.currentPage - 1);
              }
            })
            .enabled(this.state.currentPage > 1)
            .margin({ right: 10 })
          Text($r('app.string.p_page_of_fmt', this.state.currentPage.toString(), this.getTotalPages(this.filterDevices().length).toString()))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Button('>')
            .onClick(() => {
              if (this.state.currentPage < this.getTotalPages(this.filterDevices().length)) {
                this.handlePageChange(this.state.currentPage + 1);
              }
            })
            .enabled(this.state.currentPage < this.getTotalPages(this.filterDevices().length))
            .margin({ left: 10 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .padding(10)
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  OperationsTab() {
    Scroll() {
      Column() {
        Text($r('app.string.p_tab_operations'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text($r('app.string.p_quick_actions'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Button($r('app.string.p_connect_device'))
          .onClick(() => {
            this.showConnectDialog = true;
          })
          .width('100%')
          .height(50)
          .backgroundColor('#007DFF')
          .fontColor('#FFFFFF')
          .margin({ bottom: 10 })

        Button($r('app.string.p_disconnect_all'))
          .onClick(async () => {
            for (const deviceId of this.state.connectedDevices) {
              await this.manager.disconnect(deviceId);
            }
            await this.refreshData();
          })
          .width('100%')
          .height(50)
          .backgroundColor('#FF5252')
          .fontColor('#FFFFFF')
          .margin({ bottom: 10 })

        Button($r('app.string.p_reset_manager'))
          .onClick(() => {
            this.handleReset();
          })
          .width('100%')
          .height(50)
          .backgroundColor('#FF9800')
          .fontColor('#FFFFFF')
          .margin({ bottom: 20 })

        Text($r('app.string.p_pbap_ops_title'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Text($r('app.string.p_ops_hint_pbap'))
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor('#666666')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  HistoryTab() {
    Column() {
      Text($r('app.string.p_operation_history'))
        .fontSize(PageConstants.FONT_SIZE_TITLE)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      List() {
        ForEach(this.operationLog, (entry: PbapOperationLogEntry) => {
          ListItem() {
            Column() {
              Row() {
                Text(entry.operation)
                  .fontSize(PageConstants.FONT_SIZE_BODY)
                  .fontWeight(FontWeight.Medium)
                Blank()
                Text(entry.success ? '✓ Success' : '✗ Failed')
                  .fontSize(PageConstants.FONT_SIZE_CAPTION)
                  .fontColor(entry.success ? '#00C853' : '#FF0000')
              }
              .width('100%')

              Text(this.formatTimestamp(entry.timestamp))
                .fontSize(PageConstants.FONT_SIZE_CAPTION)
                .fontColor('#999999')
                .margin({ top: 5 })

              if (entry.details) {
                Text(entry.details)
                  .fontSize(PageConstants.FONT_SIZE_CAPTION)
                  .fontColor('#666666')
                  .margin({ top: 5 })
              }
            }
            .width('100%')
            .padding(15)
            .backgroundColor('#F5F5F5')
            .borderRadius(5)
            .margin({ bottom: 10 })
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  @Builder
  StatisticsTab() {
    Scroll() {
      Column() {
        Text($r('app.string.p_tab_statistics'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        if (this.state.statistics) {
          Text($r('app.string.p_connection_statistics'))
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          this.StatRow($r('app.string.p_total_conn_attempts'), ((this.state.statistics as PbapManagerStatistics).totalConnectionAttempts || 0).toString())
          this.StatRow($r('app.string.p_successful_connections'), ((this.state.statistics as PbapManagerStatistics).successfulConnections || 0).toString())
          this.StatRow($r('app.string.p_failed_connections'), ((this.state.statistics as PbapManagerStatistics).failedConnections || 0).toString())
          this.StatRow($r('app.string.p_success_rate'), ((this.state.statistics as PbapManagerStatistics).connectionSuccessRate || 0).toString() + '%')

          Divider().margin({ top: 20, bottom: 20 })

          Text($r('app.string.p_operation_statistics'))
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          this.StatRow($r('app.string.p_total_operations'), ((this.state.statistics as PbapManagerStatistics).totalOperations || 0).toString())
          this.StatRow($r('app.string.p_successful_operations'), ((this.state.statistics as PbapManagerStatistics).successfulOperations || 0).toString())
          this.StatRow($r('app.string.p_failed_operations'), ((this.state.statistics as PbapManagerStatistics).failedOperations || 0).toString())
          this.StatRow($r('app.string.p_operation_success_rate'), ((this.state.statistics as PbapManagerStatistics).operationSuccessRate || 0).toString() + '%')

          Divider().margin({ top: 20, bottom: 20 })

          Text($r('app.string.p_performance_metrics'))
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          this.StatRow($r('app.string.p_uptime'), this.formatDuration((this.state.statistics as PbapManagerStatistics).uptimeMs || 0))
          this.StatRow($r('app.string.p_operations_per_minute'), ((this.state.statistics as PbapManagerStatistics).operationsPerMinute || 0).toFixed(2))
          this.StatRow($r('app.string.p_error_rate'), ((this.state.statistics as PbapManagerStatistics).errorRate || 0).toString() + '%')
        }

        if (this.state.healthStatus) {
          Divider().margin({ top: 20, bottom: 20 })

          Text($r('app.string.p_health_status'))
            .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 10 })

          this.StatRow($r('app.string.p_health_score'), ((this.state.healthStatus as ManagerHealthStatus).healthScore || 0).toString() + '/100')
          this.StatRow($r('app.string.p_status'), (this.state.healthStatus as ManagerHealthStatus).isHealthy ? 'Healthy' : 'Unhealthy')
        }
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  SettingsTab() {
    Scroll() {
      Column() {
        Text($r('app.string.p_tab_settings'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        Text($r('app.string.p_connection_settings'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Row() {
          Text($r('app.string.p_auto_refresh'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.autoRefreshEnabled })
            .onChange((isOn: boolean) => {
              this.autoRefreshEnabled = isOn;
              if (isOn) {
                this.startAutoRefresh();
              } else {
                this.stopAutoRefresh();
              }
            })
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .margin({ bottom: 10 })

        Row() {
          Text($r('app.string.p_refresh_interval_ms'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Blank()
          Text(this.autoRefreshInterval.toString())
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .margin({ bottom: 10 })

        Divider().margin({ top: 20, bottom: 20 })

        Text($r('app.string.p_display_settings'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Row() {
          Text($r('app.string.p_items_per_page'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Blank()
          Text(this.state.itemsPerPage.toString())
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontWeight(FontWeight.Medium)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .margin({ bottom: 10 })

        Row() {
          Text($r('app.string.p_show_advanced_options'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.state.showAdvancedOptions })
            .onChange((isOn: boolean) => {
              this.state.showAdvancedOptions = isOn;
            })
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
        .margin({ bottom: 10 })

        Divider().margin({ top: 20, bottom: 20 })

        Text($r('app.string.p_manager_configuration'))
          .fontSize(PageConstants.FONT_SIZE_SUBTITLE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 10 })

        Button($r('app.string.p_view_configuration'))
          .onClick(() => {
            const config = this.manager.getConfig();
            this.showToastMessage('Config: ' + JSON.stringify(config));
          })
          .width('100%')
          .height(50)
          .backgroundColor('#007DFF')
          .fontColor('#FFFFFF')
          .margin({ bottom: 10 })

        Button($r('app.string.p_reset_to_defaults'))
          .onClick(() => {
            this.manager.setConfig({});
            this.showToastMessage('Configuration reset');
          })
          .width('100%')
          .height(50)
          .backgroundColor('#FF9800')
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  StatCard(title: ResourceStr, value: string, color: string) {
    Column() {
      Text(title)
        .fontSize(PageConstants.FONT_SIZE_CAPTION)
        .fontColor('#666666')
      Text(value)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(color)
        .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .shadow({ radius: 5, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  DeviceCard(device: PbapDeviceItem) {
    Row() {
      Column() {
        Text(device.deviceName)
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontWeight(FontWeight.Medium)
        Text(device.macAddress)
          .fontSize(PageConstants.FONT_SIZE_CAPTION)
          .fontColor('#999999')
          .margin({ top: 2 })
        Row() {
          Text($r('app.string.p_rssi_fmt', device.rssi.toString() + ' dBm'))
            .fontSize(PageConstants.FONT_SIZE_CAPTION)
            .fontColor('#666666')
          Text($r('app.string.p_battery_fmt', device.batteryLevel.toString() + '%'))
            .fontSize(PageConstants.FONT_SIZE_CAPTION)
            .fontColor('#666666')
            .margin({ left: 15 })
        }
        .margin({ top: 5 })
      }
      .layoutWeight(1)
      Button(device.isConnected ? 'Disconnect' : 'Connect')
        .onClick(async () => {
          if (device.isConnected) {
            await this.handleDisconnectDevice(device.deviceId);
          } else {
            this.connectDeviceId = device.deviceId;
            await this.handleConnectDevice();
          }
        })
        .backgroundColor(device.isConnected ? '#FF5252' : '#00C853')
        .fontColor('#FFFFFF')
        .height(40)
    }
    .width('100%')
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .shadow({ radius: 5, color: 'rgba(0,0,0,0.1)', offsetX: 0, offsetY: 2 })
    .margin({ bottom: 10 })
  }

  @Builder
  StatRow(label: ResourceStr, value: string) {
    Row() {
      Text(label)
        .fontSize(PageConstants.FONT_SIZE_BODY)
      Blank()
      Text(value)
        .fontSize(PageConstants.FONT_SIZE_BODY)
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
    .borderRadius(5)
    .margin({ bottom: 5 })
  }
}
