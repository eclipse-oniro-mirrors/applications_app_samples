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

// Deterministic logic of pages/SamplePage.ets (city picker, alphabet index, location requests) over the data of
// mock/LocationMock.ets.

import { heatCity, listData, ListItem, ProvinceWithSubCities } from '../../../../main/ets/mock/LocationMock';

// Mirrors the CurrentLocationRequest of SamplePage: priority 0x203, scenario 0x300, maxAccuracy 100.
export const REQUEST_PRIORITY: number = 0x203;
export const REQUEST_SCENARIO: number = 0x300;
export const REQUEST_MAX_ACCURACY: number = 100;
// Mirrors the literal (non-template) text assigned when a sub city is tapped.
export const SUB_CITY_LITERAL: string = '${item.name/${secondCity}}';

// Mirrors the alphabet bar built from listData names.
export function alphabetLetters(): string[] {
  return listData.map((item: ListItem): string => item.name);
}

// Mirrors AlphabetIndexer.onSelect(): the list index of a letter (-1 when absent).
export function indexOfLetter(letter: string): number {
  return alphabetLetters().indexOf(letter);
}

// Mirrors List.onScrollIndex(): the letter highlighted for the first visible group.
export function letterOfIndex(index: number): string {
  const letters: string[] = alphabetLetters();
  if (!Number.isInteger(index) || index < 0 || index >= letters.length) {
    return '';
  }
  return letters[index];
}

// Mirrors the ForEach over firstItem.city: plain names or province names of ProvinceWithSubCities entries.
export function groupNamesOf(letter: string): string[] {
  const index: number = indexOfLetter(letter);
  if (index < 0) {
    return [];
  }
  const names: string[] = [];
  const cities: (string | ProvinceWithSubCities)[] = listData[index].city;
  for (const item of cities) {
    if (typeof item === 'string') {
      names.push(item);
    } else {
      names.push(item.name);
    }
  }
  return names;
}

// Mirrors typeof item !== 'string': whether the group of a letter lists provinces with sub cities.
export function groupHasProvinces(letter: string): boolean {
  const index: number = indexOfLetter(letter);
  if (index < 0) {
    return false;
  }
  const cities: (string | ProvinceWithSubCities)[] = listData[index].city;
  return cities.length > 0 && typeof cities[0] !== 'string';
}

// Mirrors the expanded sub city list of a province (empty for plain names).
export function subCitiesOf(province: string): string[] {
  for (const group of listData) {
    const cities: (string | ProvinceWithSubCities)[] = group.city;
    for (const item of cities) {
      if (typeof item !== 'string' && item.name === province) {
        return item.city.slice();
      }
    }
  }
  return [];
}

// Mirrors the heat city grid.
export function heatCityAt(index: number): string {
  if (!Number.isInteger(index) || index < 0 || index >= heatCity.length) {
    return '';
  }
  return heatCity[index];
}

// Mirrors whether a name is offered in the heat city grid.
export function isHeatCity(name: string): boolean {
  return heatCity.indexOf(name) >= 0;
}

// Mirrors this.isCity = this.isCity === name ? '' : name (tapping an open province collapses it).
export function toggleExpanded(current: string, name: string): string {
  return current === name ? '' : name;
}

// Mirrors if (this.isCity === item.name): sub cities are rendered only for the expanded province.
export function showsSubCities(current: string, province: string): boolean {
  return current === province;
}

// Mirrors the reverse geocoding branch: address[0].locality becomes the city when available.
export function localityOf(localities: string[], previous: string): string {
  if (localities.length >= 1 && localities[0] !== '') {
    return localities[0];
  }
  return previous;
}

// Mirrors the current location text: the selected name, or the located city when nothing was selected.
export function locationTextOf(currentLocation: string, city: string): string {
  return currentLocation !== '' ? currentLocation : city;
}

// Mirrors the total number of names the picker can list (groups plus provinces' sub cities).
export function totalSelectableCount(): number {
  let count: number = 0;
  for (const group of listData) {
    const cities: (string | ProvinceWithSubCities)[] = group.city;
    for (const item of cities) {
      count += typeof item === 'string' ? 1 : 1 + item.city.length;
    }
  }
  return count;
}

// Mirrors the city picker state of SamplePage.
export class CityPickerState {
  alphabetIndex: number = 0;
  currentLocation: string = '';
  isCity: string = '';
  city: string = '';
  latitude: number = 0;
  longitude: number = 0;

  // Mirrors a heat city tap.
  selectHeat(index: number): string {
    const name: string = heatCityAt(index);
    if (name !== '') {
      this.currentLocation = name;
    }
    return this.currentLocation;
  }

  // Mirrors a province / plain name tap: select it and toggle its expansion.
  selectGroupItem(name: string): string {
    this.currentLocation = name;
    this.isCity = toggleExpanded(this.isCity, name);
    return this.isCity;
  }

  // Mirrors a sub city tap: the page assigns the single-quoted literal text.
  selectSubCity(province: string, subCity: string): string {
    if (this.isCity === province && subCitiesOf(province).indexOf(subCity) >= 0) {
      this.currentLocation = SUB_CITY_LITERAL;
    }
    return this.currentLocation;
  }

  // Mirrors List.onScrollIndex() / AlphabetIndexer.onSelect().
  scrollTo(index: number): string {
    this.alphabetIndex = index;
    return letterOfIndex(index);
  }

  // Mirrors getLastLocation(): the coordinates shown on the page.
  setLastLocation(latitude: number, longitude: number): void {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  // Mirrors the reverse geocoding result.
  locate(localities: string[]): string {
    this.city = localityOf(localities, this.city);
    return locationTextOf(this.currentLocation, this.city);
  }
}
