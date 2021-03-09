describe('404 Page', () => {
    beforeEach(() => cy.visit('/a-page-that-does-not-exist', {failOnStatusCode: false}));
});