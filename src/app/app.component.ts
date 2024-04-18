import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HomeComponent, MatToolbarModule, RouterModule],
  template: `
    <main>
      <a [routerLink]="['/']">
        <mat-toolbar color="primary">
          <header class="brand-name">
            <img
              class="brand-logo"
              src="/assets/logo.svg"
              alt="logo"
              aria-hidden="true"
            />
          </header>
        </mat-toolbar>
      </a>
      <div class="container">
        <section class="content">
          <router-outlet></router-outlet>
        </section>
      </div>
    </main>
  `,
})
export class AppComponent {
  title = 'Emanuel fp';
}
