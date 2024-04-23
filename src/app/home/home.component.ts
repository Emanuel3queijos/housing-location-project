import { Component, inject } from '@angular/core';
import { HousingLocationComponent } from '../housing-location/housing-location.component';
import { Housinglocation } from '../housinglocation';
import { CommonModule } from '@angular/common';
import { HousingService } from '../housing.service';
import { Router } from '@angular/router';
import { routes } from '../app.routes';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, HousingLocationComponent],
  template: `<section>
      <form class="mt-2 ">
        <input
          type="text"
          placeholder="Filter by city"
          #filter
          (keydown.enter)="searchNavegation(filter.value, $event)"
        />

        <button
          class="primary "
          type="button"
          (click)="searchNavegation(filter.value, $event)"
        >
          Search
        </button>
      </form>
    </section>

    <section class="results">
      <app-housing-location
        *ngFor="let housingLocation of filteredLocationList"
        [housingLocation]="housingLocation"
      >
      </app-housing-location>
    </section>`,
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  filteredLocationList: Housinglocation[] = [];
  housingLocationList: Housinglocation[] = [];
  housingService: HousingService = inject(HousingService);

  searchNavegation(text: string, event: any) {
    event.preventDefault();
    this.route.navigate(['/search', text]);
  }

  // filterResults(text: string, event: any) {
  //   event.preventDefault();
  //   if (!text) {
  //     this.filteredLocationList = this.housingLocationList;
  //     return;
  //   }

  //   this.filteredLocationList = this.housingLocationList.filter(
  //     (housingLocation) =>
  //       housingLocation?.city.toLowerCase().includes(text.toLowerCase())
  //   );
  // }
  constructor(private route: Router) {
    this.housingService
      .getAllHousingLocations()
      .then((housingLocationList: Housinglocation[]) => {
        this.housingLocationList = housingLocationList;
        this.filteredLocationList = housingLocationList;
      });
  }
}
