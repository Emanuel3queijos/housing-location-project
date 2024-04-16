import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HomeComponent } from './home/home.component';
import {MatToolbarModule} from '@angular/material/toolbar';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HomeComponent, MatToolbarModule],
  template: `
  <main >
  <mat-toolbar color="primary">


  <header class="brand-name">
      <img class="brand-logo" src="/assets/logo.svg" alt="logo" aria-hidden="true">
    </header>

  </mat-toolbar>

    <section class="content">
      <app-home></app-home>
    </section>
  </main>
`,
})
export class AppComponent {
  title = 'Emanuel fp';
}
