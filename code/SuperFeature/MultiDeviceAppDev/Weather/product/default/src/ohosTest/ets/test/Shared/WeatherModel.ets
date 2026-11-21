
export interface WeatherCity {
  name: string;
  temp: number;
  humidity: number;
  aqi: number;
}

export interface WeatherDataSourceState {
  total: number;
  reloads: number;
  adds: number;
  changes: number;
  deletes: number;
  moves: number;
}

export const WEATHER_CITY_COUNT: number = 5;

export class WeatherModel {
  private cities: WeatherCity[] = [];
  private state: WeatherDataSourceState = { total: 0, reloads: 0, adds: 0, changes: 0, deletes: 0, moves: 0 };

  constructor() {
    this.cities.push({ name: 'beijing', temp: 26, humidity: 45, aqi: 62 });
    this.cities.push({ name: 'shanghai', temp: 29, humidity: 68, aqi: 48 });
    this.cities.push({ name: 'guangzhou', temp: 33, humidity: 78, aqi: 55 });
    this.cities.push({ name: 'shenzhen', temp: 32, humidity: 75, aqi: 43 });
    this.cities.push({ name: 'hangzhou', temp: 28, humidity: 62, aqi: 70 });
  }

  public getCityCount(): number {
    return this.cities.length;
  }

  public getCities(): WeatherCity[] {
    return this.cities;
  }

  public getCity(name: string): WeatherCity | undefined {
    for (let i = 0; i < this.cities.length; i++) {
      if (name === this.cities[i].name) {
        return this.cities[i];
      }
    }
    return undefined;
  }

  public totalCount(): number {
    return this.cities.length;
  }

  public getData(index: number): WeatherCity | undefined {
    if (index < 0 || index >= this.cities.length) {
      return undefined;
    }
    return this.cities[index];
  }

  public notifyReload(): void {
    this.state.reloads++;
  }

  public notifyAdd(): void {
    this.state.adds++;
  }

  public notifyChange(): void {
    this.state.changes++;
  }

  public notifyDelete(): void {
    this.state.deletes++;
  }

  public notifyMove(): void {
    this.state.moves++;
  }

  public getState(): WeatherDataSourceState {
    return this.state;
  }

  public isTempValid(temp: number): boolean {
    return temp >= -50 && temp <= 60;
  }

  public aqiLevel(aqi: number): string {
    if (aqi <= 50) {
      return 'excellent';
    } else if (aqi <= 100) {
      return 'good';
    } else if (aqi <= 150) {
      return 'light';
    }
    return 'moderate';
  }

  public isHumidityValid(humidity: number): boolean {
    return humidity >= 0 && humidity <= 100;
  }

  public hottestIndex(): number {
    if (this.cities.length === 0) {
      return -1;
    }
    let best = 0;
    for (let i = 1; i < this.cities.length; i++) {
      if (this.cities[i].temp > this.cities[best].temp) {
        best = i;
      }
    }
    return best;
  }

  public coldestIndex(): number {
    if (this.cities.length === 0) {
      return -1;
    }
    let best = 0;
    for (let i = 1; i < this.cities.length; i++) {
      if (this.cities[i].temp < this.cities[best].temp) {
        best = i;
      }
    }
    return best;
  }

  public averageTemp(): number {
    if (this.cities.length === 0) {
      return 0;
    }
    let sum = 0;
    for (let i = 0; i < this.cities.length; i++) {
      sum += this.cities[i].temp;
    }
    return sum / this.cities.length;
  }

  public hasUniqueNames(): boolean {
    const seen = new Set<string>();
    for (let i = 0; i < this.cities.length; i++) {
      if (seen.has(this.cities[i].name)) {
        return false;
      }
      seen.add(this.cities[i].name);
    }
    return true;
  }
}
