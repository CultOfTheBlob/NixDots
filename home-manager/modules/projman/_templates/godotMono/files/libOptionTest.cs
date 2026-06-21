using #{name}.Lib;

namespace Tests;

public class LibOptionTest()
{
    [Fact]
    public void TestUnwrapOr()
    {
        Option<string> option;

        option = new Option<string>.Some("some");

        Assert.Equal("some", option.UnwrapOr("none"));

        option = new Option<string>.None();

        Assert.Equal("none", option.UnwrapOr("none"));
    }

    [Fact]
    public void TestUnwrapOrDefault()
    {
        Option<string> option;

        option = new Option<string>.Some("some");

        Assert.Equal("some", option.UnwrapOrDefault());

        option = new Option<string>.None();

        Assert.Null(option.UnwrapOrDefault());
    }

    [Fact]
    public void TestMatch()
    {
        Option<string> option;

        option = new Option<string>.Some("some");

        option.Match
        (
            some: value =>
            {
                Assert.Equal("some", value);
            },
            none: () =>
            {
                Assert.Fail();
            }
        );

        option = new Option<string>.None();

        option.Match
        (
            some: value =>
            {
                Assert.Fail();
            },
            none: () =>
            {
                Assert.Equal(new Option<string>.None(), option);
            }
        );
    }
}
