import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { DetailsComponent } from './details/details.component';

export const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'courses' },
  { path: '', component: HomeComponent, title: 'Home Page' },
  { path: 'details/:id', component: DetailsComponent, title: 'Home Details' },
];
