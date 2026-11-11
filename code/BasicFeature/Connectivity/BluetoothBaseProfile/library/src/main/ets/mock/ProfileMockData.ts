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

import { BluetoothProfileType } from '../constants/BluetoothConstants';

/**
 * A2DP音频数据接口
 */
export interface MockAudioTrack {
  title: string;
  artist: string;
  album: string;
  duration: number;
  position: number;
}

/**
 * HFP通话数据接口
 */
export interface MockCallInfo {
  phoneNumber: string;
  contactName: string;
  callState: string;
  duration: number;
  isIncoming: boolean;
}

/**
 * PBAP联系人数据接口
 */
export interface MockContact {
  name: string;
  phone: string;
  email: string;
  organization: string;
}

/**
 * MAP消息数据接口
 */
export interface MockMessage {
  sender: string;
  subject: string;
  body: string;
  timestamp: number;
  isRead: boolean;
  type: string;
}

/**
 * HDP健康数据接口
 */
export interface MockHealthReading {
  type: string;
  value: number;
  unit: string;
  timestamp: number;
}

/**
 * Profile Mock数据。
 * 提供各Profile的模拟数据。
 */
export class ProfileMockData {
  /**
   * 生成模拟音频曲目列表。
   * @returns {MockAudioTrack[]} 曲目列表
   */
  static getAudioTracks(): MockAudioTrack[] {
    return [
      { title: 'Moonlight Sonata', artist: 'Beethoven', album: 'Classical Piano', duration: 360000, position: 120000 },
      { title: 'Bohemian Rhapsody', artist: 'Queen', album: 'A Night at the Opera', duration: 354000, position: 0 },
      { title: 'Hotel California', artist: 'Eagles', album: 'Hotel California', duration: 391000, position: 200000 },
      { title: 'Imagine', artist: 'John Lennon', album: 'Imagine', duration: 187000, position: 50000 },
      { title: 'Stairway to Heaven', artist: 'Led Zeppelin', album: 'Led Zeppelin IV', duration: 482000, position: 300000 },
      { title: 'Yesterday', artist: 'The Beatles', album: 'Help!', duration: 125000, position: 0 },
      { title: 'Smells Like Teen Spirit', artist: 'Nirvana', album: 'Nevermind', duration: 301000, position: 150000 },
      { title: 'Sweet Child O Mine', artist: 'Guns N Roses', album: 'Appetite for Destruction', duration: 356000, position: 100000 },
    ];
  }

  /**
   * 生成模拟通话记录。
   * @returns {MockCallInfo[]} 通话记录
   */
  static getCallHistory(): MockCallInfo[] {
    return [
      { phoneNumber: '13800138001', contactName: 'Alice Smith', callState: 'ended', duration: 180, isIncoming: true },
      { phoneNumber: '13900139002', contactName: 'Bob Johnson', callState: 'ended', duration: 420, isIncoming: false },
      { phoneNumber: '15800158003', contactName: 'Charlie Brown', callState: 'active', duration: 60, isIncoming: true },
      { phoneNumber: '18600186004', contactName: 'Diana Prince', callState: 'missed', duration: 0, isIncoming: true },
      { phoneNumber: '13500135005', contactName: 'Edward Norton', callState: 'ended', duration: 300, isIncoming: false },
    ];
  }

  /**
   * 生成模拟联系人列表。
   * @param {number} count - 联系人数量
   * @returns {MockContact[]} 联系人列表
   */
  static getContacts(count: number = 20): MockContact[] {
    const firstNames: string[] = ['Alice', 'Bob', 'Charlie', 'Diana', 'Edward', 'Fiona', 'George', 'Helen', 'Ivan', 'Julia'];
    const lastNames: string[] = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor'];
    const orgs: string[] = ['TechCorp', 'DataInc', 'CloudSys', 'NetWorks', 'DigiLab', 'InfoTech', 'SmartDev', 'CodeBase'];
    const contacts: MockContact[] = [];
    for (let i: number = 0; i < count; i++) {
      const first: string = firstNames[i % firstNames.length];
      const last: string = lastNames[Math.floor(i / firstNames.length) % lastNames.length];
      contacts.push({
        name: first + ' ' + last,
        phone: '1' + (30 + Math.floor(Math.random() * 60)) + String(Math.floor(Math.random() * 100000000)).padStart(8, '0'),
        email: first.toLowerCase() + '.' + last.toLowerCase() + '@example.com',
        organization: orgs[i % orgs.length]
      });
    }
    return contacts;
  }

  /**
   * 生成模拟消息列表。
   * @param {number} count - 消息数量
   * @returns {MockMessage[]} 消息列表
   */
  static getMessages(count: number = 15): MockMessage[] {
    const senders: string[] = ['Alice', 'Bob', 'Charlie', 'Diana', 'Edward', 'System', 'Support'];
    const subjects: string[] = [
      'Meeting Reminder', 'Project Update', 'Lunch Plan', 'Weekly Report',
      'New Feature', 'Bug Report', 'Code Review', 'Deployment Notice',
      'Team Event', 'Holiday Schedule', 'System Maintenance'
    ];
    const messages: MockMessage[] = [];
    for (let i: number = 0; i < count; i++) {
      messages.push({
        sender: senders[i % senders.length],
        subject: subjects[i % subjects.length],
        body: 'This is the body of message #' + (i + 1) + '. Please review the content.',
        timestamp: Date.now() - (count - i) * 600000,
        isRead: Math.random() > 0.3,
        type: Math.random() > 0.5 ? 'sms' : 'email'
      });
    }
    return messages;
  }

  /**
   * 生成模拟健康数据。
   * @returns {MockHealthReading[]} 健康读数列表
   */
  static getHealthReadings(): MockHealthReading[] {
    const readings: MockHealthReading[] = [];
    const now: number = Date.now();
    // 心率数据
    for (let i: number = 0; i < 10; i++) {
      readings.push({
        type: 'heart_rate', value: 60 + Math.floor(Math.random() * 40),
        unit: 'bpm', timestamp: now - (10 - i) * 60000
      });
    }
    // 血压数据
    for (let i: number = 0; i < 5; i++) {
      readings.push({
        type: 'blood_pressure', value: 110 + Math.floor(Math.random() * 30),
        unit: 'mmHg', timestamp: now - (5 - i) * 3600000
      });
    }
    // 体温数据
    for (let i: number = 0; i < 8; i++) {
      readings.push({
        type: 'temperature', value: Math.round((36 + Math.random() * 2) * 10) / 10,
        unit: 'C', timestamp: now - (8 - i) * 1800000
      });
    }
    // 血氧数据
    for (let i: number = 0; i < 6; i++) {
      readings.push({
        type: 'blood_oxygen', value: 95 + Math.floor(Math.random() * 5),
        unit: '%', timestamp: now - (6 - i) * 300000
      });
    }
    return readings;
  }

  /**
   * 获取Profile描述信息。
   * @param {BluetoothProfileType} profile - Profile类型
   * @returns {object} Profile描述
   */
  static getProfileDescription(profile: BluetoothProfileType): object {
    const descriptions: Record<string, object> = {
      'A2DP': { name: 'Advanced Audio Distribution', cnName: 'audio_distribution', icon: 'audio', version: '1.3' },
      'HFP': { name: 'Hands-Free Profile', cnName: 'hands_free', icon: 'phone', version: '1.8' },
      'HID': { name: 'Human Interface Device', cnName: 'human_interface', icon: 'keyboard', version: '1.1' },
      'PAN': { name: 'Personal Area Network', cnName: 'personal_area_network', icon: 'network', version: '1.0' },
      'PBAP': { name: 'Phone Book Access', cnName: 'phonebook_access', icon: 'contacts', version: '1.2' },
      'MAP': { name: 'Message Access', cnName: 'message_access', icon: 'message', version: '1.4' },
      'AVRCP': { name: 'Audio/Video Remote Control', cnName: 'av_remote_control', icon: 'remote', version: '1.6' },
      'HDP': { name: 'Health Device Profile', cnName: 'health_device', icon: 'health', version: '1.0' }
    };
    return descriptions[profile] || { name: 'Unknown', cnName: 'unknown', icon: 'default', version: '0.0' };
  }
}
